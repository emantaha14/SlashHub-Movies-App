import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashhub_app/core/theme/styles_manager.dart';
import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.mainBlack,
    primaryColor: ColorManager.primary,
    appBarTheme: AppBarTheme(backgroundColor: ColorManager.mainBlack),
    textTheme: TextTheme(
      titleLarge: getBoldStyle(color: Colors.white, fontSize: 50.sp),
    ),
  );
}
