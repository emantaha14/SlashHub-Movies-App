part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchErrorState extends SearchState {
  final Failure failure;

  SearchErrorState({required this.failure});
}

final class SearchSuccessState extends SearchState {
  final List<MoviesEntity> searchedMovies;

  SearchSuccessState({required this.searchedMovies});
}
