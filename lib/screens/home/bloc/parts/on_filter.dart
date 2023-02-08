part of '../home_page_bloc.dart';

///
/// [HomePageBlocEventOnFilter]
/// Called when user selects a filter.
///
void _onFilter(
    {required AppDataRepository dataRepository,
    required HomePageBloc bloc,
    required Emitter<HomePageBlocState> emit,
    required HomePageBlocEventOnFilter event}) async {
  bloc.viewState.resultsType = event.type;

  switch (event.type) {
    case HomePageViewStateResultsType.albums:
      bloc.add(HomePageBlocEventOnKeyPress(bloc.viewState.lastQuery));
      break;
    case HomePageViewStateResultsType.artists:
      bloc.add(HomePageBlocEventOnKeyPress(bloc.viewState.lastQuery));
      break;
  }
}
