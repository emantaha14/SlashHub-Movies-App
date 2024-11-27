import 'package:flutter/material.dart';

import '../helpers/app_strings.dart';

class Routes {}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    return unDefinedRoute();
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
