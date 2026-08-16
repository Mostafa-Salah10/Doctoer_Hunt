import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/config/theme/app_styles.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,

    fontFamily: 'Rubik',
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.lightBackgroundColor,
      elevation: 0,
      // titleTextStyle: AppStyles.font18BlackBold(),
    ),

    textTheme: TextTheme(
      headlineMedium: AppStyles.font28DarkTextMedium,

      titleSmall: AppStyles.font14GreyTextregular,
      titleMedium: AppStyles.font18WhiteTextMedium,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,

    fontFamily: 'Rubik',
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.darkBackgroundColor,
      elevation: 0,
      // titleTextStyle: AppStyles.font18BlackBold(),
    ),

    textTheme: TextTheme(
      headlineMedium: AppStyles.font28DarkTextMedium.copyWith(
        color: AppColors.lightBackgroundColor,
      ),
      titleSmall: AppStyles.font14GreyTextregular,
      titleMedium: AppStyles.font18WhiteTextMedium,
    ),
  );
}

// | Style          | Size |
// | -------------- | ---: |
// | displayLarge   |   57 |
// | displayMedium  |   45 |
// | displaySmall   |   36 |
// | headlineLarge  |   32 |
// | headlineMedium |   28 |
// | headlineSmall  |   24 |
// | titleLarge     |   22 |
// | titleMedium    |   16 |
// | titleSmall     |   14 |
// | bodyLarge      |   16 |
// | bodyMedium     |   14 |
// | bodySmall      |   12 |
// | labelLarge     |   14 |
// | labelMedium    |   12 |
// | labelSmall     |   11 |
