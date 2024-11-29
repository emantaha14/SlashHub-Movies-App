import 'package:dartz/dartz.dart';
import 'package:slashhub_app/core/error_handler/error_handler.dart';
import 'package:slashhub_app/core/error_handler/failures.dart';
import 'package:slashhub_app/core/helpers/network/network_info.dart';
import 'package:slashhub_app/features/get_all_movies/data/models/movies_model.dart';
import 'package:slashhub_app/features/search/data/data_sources/search_movie_data_source.dart';
import 'package:slashhub_app/features/search/domain/repositories/search_movie_repo.dart';

class SearchMovieRepoImpl implements SearchedMovieRepo {
  final SearchMovieDataSource searchMovieDataSource;
  final NetworkInfo networkInfo;

  SearchMovieRepoImpl(
      {required this.searchMovieDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<MoviesModel>>> getSearchedMovies(
      String searchMovie) async {
    if (await networkInfo.isConnected) {
      try {
        final searchResponse = await searchMovieDataSource.getSearchedMovies(
            searchedMovie: searchMovie);
        return Right(searchResponse);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
