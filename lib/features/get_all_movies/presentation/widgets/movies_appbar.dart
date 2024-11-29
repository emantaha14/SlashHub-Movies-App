import 'package:slashhub_app/core/imports/movies_list_imports.dart';
import 'package:slashhub_app/core/routing/app_routes.dart';
import 'package:slashhub_app/features/search/presentation/pages/search_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({super.key}) : preferredSize = Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Movies List', style: TextStyle(color: ColorManager.white, fontSize: 20)),
      toolbarHeight: 100.h,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AppImages.appBarLeading,
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.searchRoute);
          },
          icon: Icon(
            Icons.search,
            color: ColorManager.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
