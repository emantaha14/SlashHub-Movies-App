import 'package:flutter/material.dart';
import 'package:slashhub_app/features/HomeScreen/pages/home_screen.dart';
import 'package:slashhub_app/features/get_all_movies/presentation/pages/movies_screen.dart';
import 'package:slashhub_app/features/search/presentation/pages/search_screen.dart';

import '../helpers/app_strings.dart';

class Routes {
  static const String moviesListRoute = '/movies';
  static const String searchRoute = '/search';
  static const String homeRoute = '/home';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.moviesListRoute:
        return MaterialPageRoute(
          builder: (context) => const MoviesScreen(),
        );
      case Routes.searchRoute:
        return MaterialPageRoute(
          builder: (context) => SearchScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
