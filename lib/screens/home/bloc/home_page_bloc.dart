import 'package:bloc/bloc.dart';

import 'package:data_repository/data_repository.dart';
import 'package:spotify_demo_app/screens/home/bloc/parts/home_page_view_state.dart';
part 'home_page_bloc_event.dart';
part 'home_page_bloc_state.dart';
part 'parts/on_start.dart';
part 'parts/on_key_press.dart';
part 'parts/on_filter.dart';

///
/// The Bloc implementation of the Home Page screen.
///
class HomePageBloc extends Bloc<HomePageBlocEvent, HomePageBlocState> {
  HomePageBloc({
    required AppDataRepository dataRepository,
  }) : super(HomePageBlocStateDefault()) {
    // register all UI events
    on<HomePageBlocEventOnResultsAvailable>(
      (event, emit) => emit(HomePageBlocStateResultsAvailable(event.type)),
    );

    on<HomePageBlocEventOnFilter>(
      (event, emit) => _onFilter(
        emit: emit,
        event: event,
        dataRepository: dataRepository,
        bloc: this,
      ),
    );

    on<HomePageBlocEventOnKeyPress>(
      (event, emit) => _onKeyPress(
        event: event,
        emit: emit,
        dataRepository: dataRepository,
        bloc: this,
        viewState: viewState,
      ),
    );

    //
    _onStart(
      dataRepository: dataRepository,
      bloc: this,
    );
  }

  final HomePageViewState viewState = HomePageViewState();
}
