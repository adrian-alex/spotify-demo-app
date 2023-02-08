part of 'home_page_bloc.dart';

class HomePageBlocState {}

/// Default UI state, displays the search bar, no chips and no results
class HomePageBlocStateDefault extends HomePageBlocState {}

/// Will display a spinner (for now, later we can do better!)
class HomePageBlocStateLoading extends HomePageBlocState {}

/// Update UI with new content of a specific [HomePageViewStateResultsType]
class HomePageBlocStateResultsAvailable extends HomePageBlocState {
  HomePageViewStateResultsType type;
  HomePageBlocStateResultsAvailable(this.type);
}
