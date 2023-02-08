import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/api/api_service.dart';
import 'package:dio/dio.dart';

part 'api_const.dart';

///
/// API Service implementation
///
class APIServiceImpl implements APIService {
  APIServiceImpl() {}

  final Dio _dio = Dio();

  @override
  Future<List<Album>> fetchAlbums({required queryString}) async {
    return [
      Album(name: "name", coverImage: "coverImage", artist: "artist", type: "type", year: "year"),
      Album(name: "name", coverImage: "coverImage", artist: "artist", type: "type", year: "year"),
      Album(name: "name", coverImage: "coverImage", artist: "artist", type: "type", year: "year"),
      Album(name: "name", coverImage: "coverImage", artist: "artist", type: "type", year: "year"),
      Album(name: "name", coverImage: "coverImage", artist: "artist", type: "type", year: "year"),
      Album(name: "name", coverImage: "coverImage", artist: "artist", type: "type", year: "year"),
    ];
  }

  @override
  Future<List<Artist>> fetchArtists({required String queryString}) async {
    return [
      Artist(name: "John User", avatar: "https://picsum.photos/250?image=9"),
      Artist(name: "John User", avatar: "https://picsum.photos/250?image=9"),
      Artist(name: "John User", avatar: "https://picsum.photos/250?image=9"),
      Artist(name: "John User", avatar: "https://picsum.photos/250?image=9"),
      Artist(name: "John User", avatar: "https://picsum.photos/250?image=9"),
    ];
  }
}
