import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slashhub_app/core/helpers/app_strings.dart';
import 'package:slashhub_app/features/HomeScreen/cubit/buttom_navigation_bar_cubit.dart';
import 'package:slashhub_app/features/get_all_movies/presentation/pages/movies_screen.dart';
import 'package:slashhub_app/features/search/presentation/pages/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const MoviesScreen(),
      SearchScreen(),
    ];

    return Scaffold(
      body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          int selectedIndex = (state is ChangeBarIndex) ? state.index : 0;

          return screens[selectedIndex];
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          int selectedIndex0 = (state is ChangeBarIndex) ? state.index : 0;

          return Container(
            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: 6,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex0,
              onTap: (value) {
                context.read<BottomNavigationBarCubit>().changeIndex(value);
              },
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.movie),
                  label: AppStrings.movies,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: AppStrings.search,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
