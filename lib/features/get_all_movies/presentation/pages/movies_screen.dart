import 'package:slashhub_app/core/common_widgets/search_error_widget.dart';
import 'package:slashhub_app/core/imports/movies_list_imports.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is MoviesLoadingState) {
              return const LoadingWidget();
            } else if (state is MoviesErrorState) {
              return CustomErrorWidget(
                errorMessage: state.failure.error,
                onPressed: () {
                  context.read<MoviesCubit>().getAllMovies();
                },
              );
            } else if (state is MoviesSuccessState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    String updatedSummary = state.movies[index].show.summary
                        .replaceAll(RegExp("[p<>b/]"), '');
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailsScreen(
                                  index: index,
                                  movies: state.movies,
                                ),
                              ));
                        },
                        child: MovieContainer(
                          movieTitle: state.movies[index].show.name,
                          movieSummary: updatedSummary,
                          movieImage:
                              state.movies[index].show.image?.original ??
                                  AppImages.noMovieImage,
                        ));
                  },
                ),
              );
            }
            return Container();
          },
        ));
  }
}
