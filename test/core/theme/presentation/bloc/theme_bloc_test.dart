import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_event.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';

void main() {
  group('ThemeBloc', () {
    late ThemeBloc themeBloc;

    setUp(() {
      themeBloc = ThemeBloc();
    });

    tearDown(() {
      themeBloc.close();
    });

    test('Initial state should be light mode', () {
      expect(themeBloc.state, ThemeState(isDarkMode: false));
    });

    blocTest<ThemeBloc, ThemeState>(
      'Emits [ThemeState(isDarkMode: true)] when SystemThemeChanged to dark',
      build: () => ThemeBloc(),
      act: (bloc) => bloc.add(SystemThemeChanged(Brightness.dark)),
      expect: () => [ThemeState(isDarkMode: true)],
    );

    blocTest<ThemeBloc, ThemeState>(
      'Emits [ThemeState(isDarkMode: false)] when SystemThemeChanged to light',
      build: () => ThemeBloc(),
      act: (bloc) => bloc.add(SystemThemeChanged(Brightness.light)),
      expect: () => [ThemeState(isDarkMode: false)],
    );
  });
}
