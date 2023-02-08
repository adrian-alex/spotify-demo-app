part of './api_service_impl.dart';

final String BASE_URL_SEARCH = "https://api.spotify.com/v1/search";
final String BASE_URL_REFRESH = "https://accounts.spotify.com/api/token";
final String ALBUM = "album";
final String ARTIST = "artist";

List<String> PATHS_REQUIRING_AUTH = [
  BASE_URL_SEARCH,
];
