import 'package:dartz/dartz.dart';
import 'package:slashhub_app/core/error_handler/failures.dart';
import 'package:slashhub_app/features/get_all_movies/domain/entities/movies_entity.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<MoviesEntity>>> getAllMovies();
}
