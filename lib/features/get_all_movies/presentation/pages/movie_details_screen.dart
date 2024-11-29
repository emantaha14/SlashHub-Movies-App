import 'package:slashhub_app/core/imports/movies_details_imports.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int index;
  final List<MoviesModel> movies;

  const MovieDetailsScreen({
    super.key,
    required this.index,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final movie = movies[index];
    String formattedDate = movie.show.premiered != null
        ? movie.show.premiered.toString().split(' ')[0]
        : "No premiere date available";

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieImage(
              image: movie.show.image?.original ?? AppImages.noMovieImage,
            ),
            DefaultSizedBox.vertical(40.h),
            Text(
              movie.show.name,
              style: getBoldStyle(color: Colors.white, fontSize: 24.sp),
            ),
            DefaultSizedBox.vertical(15.h),
            MoviesDetailsInfoText(
              infoText:
                  "Language: ${movie.show.language.toString().split('.')[1]}",
            ),
            DefaultSizedBox.vertical(10.h),
            MoviesDetailsInfoText(
              infoText: "Genres: ${movie.show.genres.join(", ")}",
            ),
            DefaultSizedBox.vertical(10.h),
            MoviesDetailsInfoText(
              infoText:
                  "Run Time: ${movie.show.runtime != null ? '${movie.show.runtime} minutes' : 'No Run Time Available'}",
            ),
            DefaultSizedBox.vertical(10.h),
            MoviesDetailsInfoText(
              infoText: "Premiere Date: $formattedDate",
            ),
            DefaultSizedBox.vertical(15.h),
            Text(
              "Summary",
              style: getBoldStyle(color: Colors.white, fontSize: 24.sp),
            ),
            DefaultSizedBox.vertical(15.h),
            Text(
              movie.show.summary.replaceAll(RegExp(r'<.*?>'), ''),
              style: getLightStyle(color: Colors.grey[400]!, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
