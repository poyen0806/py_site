import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_event.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(_initialThemeState()) {
    on<SystemThemeChanged>((event, emit) {
      emit(ThemeState(isDarkMode: event.brightness == Brightness.dark));
    });
  }

  static ThemeState _initialThemeState() {
    return ThemeState(isDarkMode: false);
  }
}
