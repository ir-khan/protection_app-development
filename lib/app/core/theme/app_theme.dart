import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.background,
    highlightColor: AppColors.transparent,
    splashColor: AppColors.transparent,
    useMaterial3: true,
    fontFamily: "Inter",
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
