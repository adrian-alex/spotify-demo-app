import 'package:data_repository/data_repository.dart';

///
/// API Service
///
abstract class APIService {
  ///
  /// Will fetch and return a list of [Album]
  /// If the API call fails then will return empty.
  ///
  /// FIXME implement proper error handling
  /// FIXME implement lazy loading with cursor or index
  ///
  Future<List<Album>> fetchAlbums({required queryString}) async => [];

  ///
  /// Will fetch and return a list of [Album]
  /// If the API call fails then will return empty.
  ///
  /// FIXME implement proper error handling
  /// FIXME implement lazy loading with cursor or index
  ///
  Future<List<Artist>> fetchArtists({required String queryString}) async => [];
}
