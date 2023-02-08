part of 'home_page_bloc.dart';

abstract class HomePageBlocEvent {
  const HomePageBlocEvent();
}

/// New data available
class HomePageBlocEventOnResultsAvailable extends HomePageBlocEvent {
  HomePageViewStateResultsType type;
  HomePageBlocEventOnResultsAvailable(this.type);
}

/// Key press event
class HomePageBlocEventOnKeyPress extends HomePageBlocEvent {
  final String text;
  HomePageBlocEventOnKeyPress(this.text);
}

/// On filter change
class HomePageBlocEventOnFilter extends HomePageBlocEvent {
  HomePageViewStateResultsType type;
  HomePageBlocEventOnFilter(this.type);
}
