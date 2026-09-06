import 'package:flutter/material.dart';
import 'package:islamiapp/common/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      foregroundColor: AppColors.goldColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.goldColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'jannah',
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.goldColor),
  );
}
