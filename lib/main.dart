import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_demo_app/app.dart';

/// The entry point of the app.
/// Uses dependency injection. E.g [AppDataRepository]
///
/// Here we create our Repo providers and start the [SpotifyApp]
///
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  var app = MultiRepositoryProvider(
    providers: [
      RepositoryProvider<AppDataRepository>(
        create: (context) => AppDataRepositoryImpl(),
      ),
    ],
    child: SpotifyApp(),
  );

  runApp(app);
}
