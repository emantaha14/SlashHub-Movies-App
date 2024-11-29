import 'package:slashhub_app/core/imports/search_imports.dart';
import 'package:slashhub_app/features/get_all_movies/data/models/movies_model.dart';


class SearchSuccessWidget extends StatelessWidget {
  final List<MoviesEntity> searchedMovies;

  const SearchSuccessWidget({super.key, required this.searchedMovies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: ListView.builder(
        itemCount: searchedMovies.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final movie = searchedMovies[index].show;
          final summary = movie.summary.replaceAll(RegExp(r'<.*?>'), '');
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsScreen(
                      index: index,
                      movies: searchedMovies,
                    ),
                  ));
            },
            child: MovieContainer(
              movieTitle: movie.name,
              movieSummary: summary,
              movieImage: movie.image?.original ?? AppImages.noMovieImage,
            ),
          );
        },
      ),
    );
  }
}
