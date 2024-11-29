import 'package:slashhub_app/core/imports/movies_details_imports.dart';

class MoviesDetailsInfoText extends StatelessWidget {
  final String infoText;

  const MoviesDetailsInfoText({super.key, required this.infoText});

  @override
  Widget build(BuildContext context) {
    return Text(
      infoText,
      style: getRegularStyle(color: Colors.grey[400]!, fontSize: 16),
    );
  }
}
