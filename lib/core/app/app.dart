import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slashhub_app/core/dependency_injection/di.dart';
import 'package:slashhub_app/core/routing/app_routes.dart';
import 'package:slashhub_app/core/theme/theme_manager.dart';
import 'package:slashhub_app/features/HomeScreen/cubit/buttom_navigation_bar_cubit.dart';
import 'package:slashhub_app/features/HomeScreen/pages/home_screen.dart';
import 'package:slashhub_app/features/get_all_movies/presentation/cubit/movies_cubit.dart';
import 'package:slashhub_app/features/search/presentation/cubit/search_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              MoviesCubit(moviesUseCase: sl())..getAllMovies(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              SearchCubit(searchedMoviesUseCase: sl()),
        ),
        BlocProvider(
          create: (context) => BottomNavigationBarCubit(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.homeRoute,
          home: const HomeScreen()),
    );
  }
}
