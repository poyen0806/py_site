import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:py_site/core/theme/presentation/widgets/app_theme.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState({required this.isDarkMode});

  ThemeData get theme => AppTheme.getTheme(isDarkMode);

  @override
  List<Object?> get props => [isDarkMode];
}
