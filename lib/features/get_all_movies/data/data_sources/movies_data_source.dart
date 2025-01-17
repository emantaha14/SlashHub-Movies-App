import 'package:slashhub_app/core/error_handler/error_exception.dart';
import 'package:slashhub_app/core/helpers/app_constants.dart';
import 'package:slashhub_app/core/networking/api_services.dart';
import 'package:slashhub_app/features/get_all_movies/data/models/movies_model.dart';

abstract class MoviesDataSource {
  Future<List<MoviesModel>> getAllMovies();
}

class MoviesDataSourceImpl implements MoviesDataSource {
  @override
  Future<List<MoviesModel>> getAllMovies() async {
    const baseUrl = "${AppConstants.baseUrl}${AppConstants.allMoviesEndPoint}";

    final response = await ApiServices.getData(urll: baseUrl);
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
