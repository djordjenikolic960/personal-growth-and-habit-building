import 'package:flutter/material.dart';

import '../../common/constant/colors.dart';

ThemeData growDailyThemeData() {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: DailyGrowColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      foregroundColor: DailyGrowColors.backgroundColor,
      backgroundColor: DailyGrowColors.backgroundColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Color(0xFF573353),
      ),
    ),
  );
}
