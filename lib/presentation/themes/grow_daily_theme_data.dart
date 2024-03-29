import 'package:flutter/material.dart';

ThemeData growDailyThemeData() {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xFFFFF3E9),
    appBarTheme: const AppBarTheme(
      foregroundColor: Color(0xFFFFF3E9),
      backgroundColor: Color(0xFFFFF3E9),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Color(0xFF573353),
      ),
    ),
  );
}
