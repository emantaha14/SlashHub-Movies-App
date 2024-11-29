part of 'buttom_navigation_bar_cubit.dart';

@immutable
sealed class BottomNavigationBarState {}

final class BottomNavigationBarInitial extends BottomNavigationBarState {}

final class ChangeBarIndex extends BottomNavigationBarState {
  final int index;

  ChangeBarIndex({required this.index});
}
