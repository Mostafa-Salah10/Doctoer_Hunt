import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,

    fontFamily: 'Cairo',
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      // titleTextStyle: AppStyles.font18BlackBold(),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.grey[900],

    fontFamily: 'Cairo',
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.grey[900],
      elevation: 0,
      // titleTextStyle: AppStyles.font18BlackBold(),
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
