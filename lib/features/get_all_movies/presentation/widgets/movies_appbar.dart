import 'package:slashhub_app/core/imports/movies_list_imports.dart';

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
          onPressed: () {},
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
