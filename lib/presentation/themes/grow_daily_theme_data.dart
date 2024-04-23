import 'package:flutter/material.dart';

import '../../common/constant/colors.dart';

ThemeData growDailyThemeData() {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: DailyGrowColors.backgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: DailyGrowColors.textColor,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: DailyGrowColors.backgroundColor,
      backgroundColor: DailyGrowColors.backgroundColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: DailyGrowColors.secondaryColor,
      ),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: "KlasikRegular",
        color: DailyGrowColors.secondaryColor,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "KlasikRegular",
        color: DailyGrowColors.secondaryColor,
      ),
      titleMedium: TextStyle(
        fontFamily: "Manrope",
        color: DailyGrowColors.secondaryColor,
      ),
      titleSmall: TextStyle(
        fontFamily: "Manrope",
        color: DailyGrowColors.secondaryColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Manrope",
        color: DailyGrowColors.secondaryColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Manrope",
        color: DailyGrowColors.secondaryColor,
      ),
      bodySmall: TextStyle(
        fontFamily: "Manrope",
        color: DailyGrowColors.secondaryColor,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearTrackColor: DailyGrowColors.secondaryColor,
    ),
    dividerTheme: const DividerThemeData(
      color: DailyGrowColors.backgroundColor,
    ),
  );
}
