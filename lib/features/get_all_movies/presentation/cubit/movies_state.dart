part of 'movies_cubit.dart';


@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoadingState extends MoviesState {}

final class MoviesErrorState extends MoviesState {
  final Failure failure;

  MoviesErrorState({required this.failure});
}

final class MoviesSuccessState extends MoviesState {
  final List<MoviesModel> movies;

  MoviesSuccessState({required this.movies});
}
