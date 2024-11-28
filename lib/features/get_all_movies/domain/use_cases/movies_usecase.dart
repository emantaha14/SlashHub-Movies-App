import 'package:dartz/dartz.dart';
import 'package:slashhub_app/core/error_handler/failures.dart';
import 'package:slashhub_app/features/get_all_movies/domain/entities/movies_entity.dart';
import 'package:slashhub_app/features/get_all_movies/domain/repositories/movies_repo.dart';

class MoviesUseCase {
  final MoviesRepo moviesRepo;

  MoviesUseCase({required this.moviesRepo});

  Future<Either<Failure, List<MoviesEntity>>> call() async {
    return await moviesRepo.getAllMovies();
  }
}
