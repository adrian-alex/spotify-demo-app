import 'models/models.dart';

abstract class AppDataRepository {
  ///
  /// Will return a list of [Album] by [queryString].
  /// Empty query string will return no results.
  ///
  /// TODO implement caching
  ///
  Future<List<Album>> fetchAlbums({required String queryString}) async => [];

  ///
  /// Will return a list of [Artist] by [queryString].
  /// Empty query string will return no results.
  ///
  /// TODO implement caching
  ///
  Future<List<Artist>> fetchArtists({required String queryString}) async => [];
}
