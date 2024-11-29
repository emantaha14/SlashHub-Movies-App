import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slashhub_app/core/imports/movies_list_imports.dart';
import 'package:slashhub_app/features/HomeScreen/cubit/buttom_navigation_bar_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({super.key}) : preferredSize = Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Movies List',
          style: TextStyle(color: ColorManager.white, fontSize: 20)),
      toolbarHeight: 100.h,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AppImages.appBarLeading,
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.read<BottomNavigationBarCubit>().changeIndex(1);
          },
          icon: Icon(
            Icons.search,
            color: ColorManager.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
