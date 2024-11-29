import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashhub_app/core/dependency_injection/di.dart';
import 'package:slashhub_app/core/routing/app_routes.dart';
import 'package:slashhub_app/core/theme/theme_manager.dart';
import 'package:slashhub_app/features/get_all_movies/presentation/cubit/movies_cubit.dart';
import 'package:slashhub_app/features/get_all_movies/presentation/pages/movies_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.moviesListRoute,
        home: const MoviesScreen());
  }
}
