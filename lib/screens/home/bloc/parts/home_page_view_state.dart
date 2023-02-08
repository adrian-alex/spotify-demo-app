import 'package:data_repository/data_repository.dart';

/// The user selections
enum HomePageViewStateResultsType { albums, artists }

///
/// The UI state. Meant to be accessed by the UI.
/// Either [HomePageViewStateResultsType.albums] or [HomePageViewStateResultsType.artists]
/// And depending on the type, show albums or artists.
/// Keeping the results in memory for better UX.
///
/// TODO In the future implement lazy loading of more results!
///
class HomePageViewState {
  HomePageViewStateResultsType resultsType = HomePageViewStateResultsType.albums;
  List<Album> albums = [];
  List<Artist> artists = [];
  String lastQuery = "";
}
