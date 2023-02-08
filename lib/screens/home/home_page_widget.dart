import 'package:data_repository/data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_demo_app/screens/home/bloc/home_page_bloc.dart';
import 'package:spotify_demo_app/screens/home/parts/animated_background/animated_background.dart';
import 'package:spotify_demo_app/screens/home/parts/search_results_list/search_result_list_widget.dart';
import 'package:spotify_demo_app/shared/shared.dart';
import 'package:spotify_demo_app/style/style.dart';

part 'home_page_widget_parts.dart';

///
/// Implementation of the Home Page widget
///
class HomePageWidget extends StatelessWidget {
  static Widget instance() => BlocProvider(
        create: (context) {
          return HomePageBloc(
            dataRepository: RepositoryProvider.of<AppDataRepository>(context),
          );
        },
        child: const HomePageWidget(),
      );

  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }
}
