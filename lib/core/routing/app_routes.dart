import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slashhub_app/core/dependency_injection/di.dart';
import 'package:slashhub_app/features/get_all_movies/presentation/cubit/movies_cubit.dart';
import 'package:slashhub_app/features/get_all_movies/presentation/pages/movies_screen.dart';
import 'package:slashhub_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:slashhub_app/features/search/presentation/pages/search_screen.dart';

import '../helpers/app_strings.dart';

class Routes {
  static const String moviesListRoute = '/movies';
  static const String searchRoute = '/search';
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
