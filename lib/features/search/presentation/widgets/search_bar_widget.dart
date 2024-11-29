import 'package:slashhub_app/core/imports/search_imports.dart';


class SearchBarWidget extends StatelessWidget {
  final String labelText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const SearchBarWidget({
    super.key,
    required this.labelText,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fillColor = ColorManager.cardBackGround;
    final shadow = theme.brightness == Brightness.light
        ? ColorManager.mainBlack.withOpacity(0.2)
        : ColorManager.white.withOpacity(0.2);
    final textColor = theme.brightness == Brightness.light
        ? ColorManager.white
        : ColorManager.white;
    return Padding(
      padding:
          EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w, bottom: 30.h),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: shadow, blurRadius: 15.r, spreadRadius: 3.r),
          ],
        ),
        child: TextField(
          controller: controller,
          cursorColor: textColor,
          onChanged: onChanged,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: ColorManager.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            filled: true,
            fillColor: fillColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.white),
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: textColor),
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            suffixIcon: Icon(Icons.search, color: ColorManager.white),
            focusColor: ColorManager.white,
            hoverColor: ColorManager.white,
            suffixIconColor: ColorManager.white,
          ),
        ),
      ),
    );
  }
}
