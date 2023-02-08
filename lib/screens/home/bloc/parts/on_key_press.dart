part of '../home_page_bloc.dart';

///
/// [HomePageBlocEventOnKeyPress]
/// Called when user presses a key.
///
void _onKeyPress(
    {required AppDataRepository dataRepository,
    required HomePageBloc bloc,
    required HomePageViewState viewState,
    required HomePageBlocEventOnKeyPress event,
    required Emitter<HomePageBlocState> emit}) async {
  var text = event.text.trim();
  if (text.isEmpty) {
    viewState.albums.clear();
    emit(HomePageBlocStateDefault());
    return;
  }
  viewState.lastQuery = text;

  switch (viewState.resultsType) {
    case HomePageViewStateResultsType.albums:
      // if not prev results, display loading state
      if (viewState.albums.isEmpty) {
        emit(HomePageBlocStateLoading());
      }

      // fetch new albums
      var newAlbums = await dataRepository.fetchAlbums(queryString: text);
      if (newAlbums.isNotEmpty) {
        viewState.albums = newAlbums;
      }
      emit(HomePageBlocStateResultsAvailable(viewState.resultsType));
      break;
    case HomePageViewStateResultsType.artists:
      // if not prev results, display loading state
      if (viewState.albums.isEmpty) {
        emit(HomePageBlocStateLoading());
      }

      // fetch new albums
      var newArtists = await dataRepository.fetchArtists(queryString: text);
      if (newArtists.isNotEmpty) {
        viewState.artists = newArtists;
      }
      emit(HomePageBlocStateResultsAvailable(viewState.resultsType));
      break;
  }
}
