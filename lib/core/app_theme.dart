import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constants/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: "Inter",
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: AppColors.white,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.gray,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: "Inter",
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: AppColors.black,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.gray,
      ),
    ),
  );
}
