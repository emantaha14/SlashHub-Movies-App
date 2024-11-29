import 'package:slashhub_app/core/helpers/app_strings.dart';
import 'package:slashhub_app/core/imports/movies_details_imports.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int index;
  final List<MoviesEntity> movies;

  const MovieDetailsScreen({
    super.key,
    required this.index,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final movie = movies[index];
    String formattedDate = movie.show.premiered == DateTime(0000)
        ? AppStrings.noPremiereDate
        : movie.show.premiered.toString().split(' ')[0];

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
              infoText: "${AppStrings.language} ${movie.show.language}",
            ),
            DefaultSizedBox.vertical(10.h),
            MoviesDetailsInfoText(
              infoText: "${AppStrings.genres} ${movie.show.genres.join(", ")}",
            ),
            DefaultSizedBox.vertical(10.h),
            MoviesDetailsInfoText(
              infoText:
                  "${AppStrings.runTime} ${movie.show.runtime == 0 ? AppStrings.noRunTime : '${movie.show.runtime} ${AppStrings.minutes}'}",
            ),
            DefaultSizedBox.vertical(10.h),
            MoviesDetailsInfoText(
              infoText: "${AppStrings.premiereDate} $formattedDate",
            ),
            DefaultSizedBox.vertical(15.h),
            Text(
              AppStrings.summary,
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
