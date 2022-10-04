import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primeryColor,
      hintColor: AppColors.hintColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: AppColors.primeryColor,
              fontWeight: FontWeight.w500,
              fontFamily: AppStrings.fontFamily,
              fontSize: 20),
          centerTitle: true),
      fontFamily: AppStrings.fontFamily,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.primeryColor,
          fontSize: 18,
          height: 1.3,
          fontWeight: FontWeight.bold,
          fontFamily: AppStrings.fontFamily,
        ),
      ));
}
