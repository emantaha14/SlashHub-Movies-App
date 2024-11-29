import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'buttom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());

  int index = 0;

  void changeIndex(int index) {
    emit(ChangeBarIndex(index: index));
  }

  get getIndex => index;
}
