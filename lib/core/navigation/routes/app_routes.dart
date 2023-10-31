
import 'package:flutter/material.dart';
import 'package:microtectask/core/navigation/navigator_service/navigator_service.dart';
import 'package:microtectask/features/all_films_page/presentation/pages/film_details_screen.dart';
import 'package:microtectask/features/all_films_page/presentation/pages/films_page.dart';
import 'package:microtectask/features/all_films_page/presentation/pages/search_result_screen.dart';
import 'package:microtectask/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';
class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String filmsScreen = '/films_screen';
  static const String  filmDetailsScreen = '/filmDetailsScreen';
  static const String    searchResultScreen = '/searchResultScreen';


  static dynamic router = GoRouter(
    navigatorKey: NavigatorService.navigatorKey,
    initialLocation: splashScreen,
    routes: [
      GoRoute(
        name: splashScreen, // Optional, add name to your routes. Allows you navigate by name instead of path
        path: splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        name: filmsScreen, // Optional, add name to your routes. Allows you navigate by name instead of path
        path: filmsScreen,
        builder: (context, state) => FilmsPage(),
      ),
      GoRoute(
        name: filmDetailsScreen, // Optional, add name to your routes. Allows you navigate by name instead of path
        path: filmDetailsScreen,
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>?;
          return FilmDetailsScreen(extraData: extraData,);
        },
      ),

      GoRoute(
        name: searchResultScreen, // Optional, add name to your routes. Allows you navigate by name instead of path
        path: searchResultScreen,
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>?;
          return SearchResultScreen(extraData: extraData,);
        },
      ),
    ],
  );
}
