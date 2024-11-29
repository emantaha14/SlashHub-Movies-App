import 'package:slashhub_app/core/imports/movies_list_imports.dart';
import 'package:slashhub_app/features/get_all_movies/data/models/movies_model.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesUseCase moviesUseCase;

  MoviesCubit({required this.moviesUseCase}) : super(MoviesInitial());

  void getAllMovies() async {
    emit(MoviesLoadingState());
    final MoviesRespone = await moviesUseCase.call();
    MoviesRespone.fold(
      (failure) {
        emit(MoviesErrorState(failure: failure));
      },
      (movies) {
        emit(MoviesSuccessState(movies: movies));
      },
    );
  }
}
