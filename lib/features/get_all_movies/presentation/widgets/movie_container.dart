import 'package:slashhub_app/core/imports/movies_list_imports.dart';

class MovieContainer extends StatelessWidget {
  final String movieTitle;
  final String movieSummary;
  final String movieImage;

  const MovieContainer({
    super.key,
    required this.movieTitle,
    required this.movieSummary,
    required this.movieImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.cardBackGround,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 150.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(movieImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieTitle,
                    style: getBoldStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    movieSummary,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: getLightStyle(
                        color: Colors.grey[300] ?? Colors.grey,
                        fontSize: 15.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
