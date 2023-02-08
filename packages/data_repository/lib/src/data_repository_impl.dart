import 'package:data_repository/src/data_repository.dart';
import 'package:data_repository/src/models/album_model.dart';
import 'package:data_repository/src/models/artist_model.dart';

import 'api/api.dart';

class AppDataRepositoryImpl implements AppDataRepository {
  final APIService _apiService = APIServiceImpl();

  @override
  Future<List<Album>> fetchAlbums({required String queryString}) => _apiService.fetchAlbums(queryString: queryString);

  @override
  Future<List<Artist>> fetchArtists({required String queryString}) => _apiService.fetchArtists(queryString: queryString);
}
