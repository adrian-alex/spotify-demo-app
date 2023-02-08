import 'dart:convert';

import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/api/api_service.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

part 'api_const.dart';

///
/// API Service implementation
///
class APIServiceImpl implements APIService {
  DateFormat _dateFormat = new DateFormat("yyyy-mm-dd");

  APIServiceImpl() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        await _attachAuthHeaders(options, handler);
        handler.next(options);
      },
      onError: (e, handler) {
        if (e.response != null) {
          _handleError(e, handler);
        } else {
          handler.next(e);
        }
      },
    ));
  }

  final Dio _dio = Dio();
  static final String spotifyClientId = "3af8e17840684c5bb3325a5e8b8e808d";
  static final String spotifyClientSecret = "e46b037b7f76416ca7e3ac9676f557f7";

  String? _memAccessToken; // used to authenticate requests
  CancelToken? _cancelToken; // used to cancel prev ongoing requests

  @override
  Future<List<Album>> fetchAlbums({required queryString}) async {
    if (_cancelToken != null && !_cancelToken!.isCancelled) {
      _cancelToken?.cancel();
    }
    _cancelToken = CancelToken();

    var result = await _dio.get('$BASE_URL_SEARCH?q=$queryString&type=$ALBUM', cancelToken: _cancelToken);
    if (result.statusCode == 200) {
      var rawAlbums = result.data["albums"]["items"] as List;
      return rawAlbums
          .map(
            (e) => Album(
                name: e["name"],
                coverImage: (e["images"] as List)[0]["url"],
                artists: (e["artists"] as List).map((e) => e["name"].toString()).toList(),
                type: AlbumType.values.firstWhere((element) => element.name == e["album_type"], orElse: () => AlbumType.other),
                year: e["release_date_precision"] == "day"
                    ? _dateFormat.parse(e["release_date"]).year.toString()
                    : e["release_date"]),
          )
          .toList();
    }
    return [];
  }

  @override
  Future<List<Artist>> fetchArtists({required String queryString}) async {
    if (_cancelToken != null && !_cancelToken!.isCancelled) {
      _cancelToken?.cancel();
    }
    _cancelToken = CancelToken();
    var result = await _dio.get('$BASE_URL_SEARCH?q=$queryString&type=$ARTIST', cancelToken: _cancelToken);
    if (result.statusCode == 200) {
      var rawArtists = result.data["artists"]["items"] as List;
      return rawArtists.map((e) {
        var images = (e["images"] as List);
        return Artist(name: e["name"], avatar: images.isEmpty ? '' : images[0]["url"]);
      }).toList();
    }
    return [];
  }

  /// Will refresh a new token or null if failed
  Future<String?> _refreshToken() async {
    final bytes = utf8.encode(spotifyClientId + ":" + spotifyClientSecret);
    var result = await _dio.post(
      BASE_URL_REFRESH,
      data: {
        "grant_type": "client_credentials",
      },
      options: Options(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          "Authorization": "Basic " + base64.encode(bytes),
        },
      ),
    );

    if (result.statusCode != 200) return null;
    return result.data["access_token"];
  }

  Future<void> _handleError(DioError error, ErrorInterceptorHandler handler) async {
    RequestOptions requestOptions = error.requestOptions;

    if (error.response?.statusCode == 401) {
      try {
        _memAccessToken = await _refreshToken();
        if (_memAccessToken == null) {
          handler.next(error);
          return;
        }
        await _retry(requestOptions, handler, _memAccessToken!);
      } catch (_) {
        handler.next(error);
      }
    } else {
      handler.next(error);
    }
  }

  Future<RequestOptions> _attachAuthHeaders(RequestOptions options, RequestInterceptorHandler handler) async {
    bool requiresAuth = PATHS_REQUIRING_AUTH.where((element) => options.path.contains(element)).toList().isNotEmpty;
    if (!requiresAuth) return options;

    if (_memAccessToken != null) {
      options.headers["Authorization"] = "Bearer " + _memAccessToken!;
      options.headers["Content-Type"] = "application/json";
    }

    return options;
  }

  Future<void> _retry(RequestOptions requestOptions, ErrorInterceptorHandler handler, String accessToken) async {
    final opts = new Options(method: requestOptions.method);
    var dio = Dio();
    dio.options.headers["Authorization"] = "Bearer " + accessToken;
    final response = await dio.request(requestOptions.path,
        options: opts,
        cancelToken: requestOptions.cancelToken,
        onReceiveProgress: requestOptions.onReceiveProgress,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters);
    handler.resolve(response);
  }
}
