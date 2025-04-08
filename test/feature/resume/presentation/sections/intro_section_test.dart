import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/feature/resume/presentation/sections/intro_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';

void main() {
  group('IntroSection Widget', () {
    Widget buildTestableWidget() {
      return MaterialApp(
        home: BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc()..emit(const ThemeState(isDarkMode: false)),
          child: const Scaffold(body: IntroSection()),
        ),
      );
    }

    testWidgets('renders welcome text and profile image', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildTestableWidget());

      final richTextFinder = find.byType(RichText);
      expect(richTextFinder, findsOneWidget);

      final RichText richText = tester.widget(richTextFinder);
      final textSpan = richText.text as TextSpan;

      expect(textSpan.toPlainText(), contains("Welcome, I'm"));
      expect(textSpan.toPlainText(), contains('PoYen'));
      expect(textSpan.toPlainText(), contains('Student / Developer'));

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsOneWidget);
    });
  });
}
