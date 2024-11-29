import 'package:slashhub_app/core/imports/search_imports.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchedMoviesUseCase searchedMoviesUseCase;

  SearchCubit({required this.searchedMoviesUseCase}) : super(SearchInitial());

  void searchForMovie({required String searchedMovie}) async {
    emit(SearchLoadingState());
    final searchResponse =
        await searchedMoviesUseCase.call(searchedMovie: searchedMovie);
    searchResponse.fold(
      (failure) {
        emit(SearchErrorState(failure: failure));
      },
      (searchedMovies) {
        emit(SearchSuccessState(searchedMovies: searchedMovies));
      },
    );
  }
}
