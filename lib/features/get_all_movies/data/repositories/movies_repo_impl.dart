import 'package:dartz/dartz.dart';
import 'package:slashhub_app/core/error_handler/error_handler.dart';
import 'package:slashhub_app/core/error_handler/failures.dart';
import 'package:slashhub_app/core/helpers/network/network_info.dart';
import 'package:slashhub_app/features/get_all_movies/data/data_sources/movies_data_source.dart';
import 'package:slashhub_app/features/get_all_movies/domain/entities/movies_entity.dart';
import 'package:slashhub_app/features/get_all_movies/domain/repositories/movies_repo.dart';

class MoviesRepoImpl implements MoviesRepo {
  final MoviesDataSource moviesDataSource;
  final NetworkInfo networkInfo;

  MoviesRepoImpl({required this.moviesDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<MoviesEntity>>> getAllMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final moviesResponse = await moviesDataSource.getAllMovies();
        return Right(moviesResponse);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
