import 'package:dartz/dartz.dart';
import 'package:slashhub_app/core/error_handler/failures.dart';
import 'package:slashhub_app/features/get_all_movies/data/models/movies_model.dart';
import 'package:slashhub_app/features/search/domain/repositories/search_movie_repo.dart';

class SearchedMoviesUseCase {
  final SearchedMovieRepo searchedMovieRepo;

  SearchedMoviesUseCase({required this.searchedMovieRepo});

  Future<Either<Failure, List<MoviesEntity>>> call(
      {required String searchedMovie}) async {
    return await searchedMovieRepo.getSearchedMovies(searchedMovie);
  }
}
