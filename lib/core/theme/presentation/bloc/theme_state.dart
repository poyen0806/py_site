import 'package:flutter/material.dart';

class ThemeState {
  bool isDarkMode;

  ThemeState({required this.isDarkMode});

  // Define it here to customize the light theme
  static final ThemeData lightTheme = ThemeData.light();

  // Define it here to customize the dark theme
  static final ThemeData darkTheme = ThemeData.dark();

  ThemeData get theme => isDarkMode ? darkTheme : lightTheme;
}
