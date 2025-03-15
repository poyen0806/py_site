import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey[700]!,
        backgroundColor: Colors.orange[100]!,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey[900]!,
        backgroundColor: Colors.orange[400]!,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );

  static ThemeData getTheme(bool isDarkMode) {
    return isDarkMode ? darkTheme : lightTheme;
  }
}
