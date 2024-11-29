import 'package:slashhub_app/core/imports/movies_details_imports.dart';

class MovieImage extends StatelessWidget {
  final String image;

  const MovieImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: ColorManager.white.withOpacity(0.5),
              spreadRadius: 4.r,
              blurRadius: 10.r,
              offset: const Offset(0, 1), // Shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.network(
            image,
            height: 400.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
