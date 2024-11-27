import 'package:flutter/material.dart';
import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.white,
    primaryColor: ColorManager.primary,
  );
}
