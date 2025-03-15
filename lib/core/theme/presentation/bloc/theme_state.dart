import 'package:flutter/material.dart';
import 'package:py_site/core/theme/presentation/widgets/app_theme.dart';

class ThemeState {
  final bool isDarkMode;

  const ThemeState({required this.isDarkMode});

  ThemeData get theme => AppTheme.getTheme(isDarkMode);
}

