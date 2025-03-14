import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_event.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeBloc', () {
    late ThemeBloc themeBloc;

    setUp(() {
      themeBloc = ThemeBloc();
    });

    tearDown(() {
      themeBloc.close();
    });

    test('initial state is correct', () {
      expect(themeBloc.state.isDarkMode, false);
    });

    test('emits correct state when SystemThemeChanged event is added with dark mode', () async {
      themeBloc.add(SystemThemeChanged(Brightness.dark));

      await Future.delayed(Duration(milliseconds: 100));

      expect(themeBloc.state.isDarkMode, true);
    });

    test('emits correct state when SystemThemeChanged event is added with light mode', () async {
      themeBloc.add(SystemThemeChanged(Brightness.light));

      await Future.delayed(Duration(milliseconds: 100));

      expect(themeBloc.state.isDarkMode, false);
    });
  });
}
