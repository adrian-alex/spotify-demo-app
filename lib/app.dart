import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_demo_app/screens/screens.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

///
/// Main App widget implementation.
///
class SpotifyApp extends StatelessWidget {
  SpotifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Welcome to Spotify App',
      theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme().copyWith(
            displayLarge: const TextStyle(color: Colors.white),
            displayMedium: const TextStyle(color: Colors.white),
            bodyMedium: const TextStyle(color: Colors.white),
            titleMedium: const TextStyle(color: Colors.white),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            iconColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 32)),
    );
  }

  /// only one route for now
  final _router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// Shell routes are used when the app requires multiple main routes, like /login/* and /dashboard/*
      /// Only one for now
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: HomePageWidget.instance());
            },
          ),
        ],
      ),
    ],
  );
}
