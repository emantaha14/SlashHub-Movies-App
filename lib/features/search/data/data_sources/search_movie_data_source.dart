import 'package:slashhub_app/core/error_handler/error_exception.dart';
import 'package:slashhub_app/core/helpers/app_constants.dart';
import 'package:slashhub_app/core/networking/api_services.dart';
import 'package:slashhub_app/features/get_all_movies/data/models/movies_model.dart';

abstract class SearchMovieDataSource {
  Future<List<MoviesModel>> getSearchedMovies({required String searchedMovie});
}

class SearchMovieDataSourceImpl implements SearchMovieDataSource {
  @override
  Future<List<MoviesModel>> getSearchedMovies(
      {required String searchedMovie}) async {
    String url =
        "${AppConstants.baseUrl}${AppConstants.searchEndPoint}$searchedMovie}";

    final response = await ApiServices.getData(urll: url);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final moviesResponse =
          data.map((movie) => MoviesModel.fromJson(movie)).toList();
      return moviesResponse;
    } else {
      throw ServerException();
    }
  }
}
