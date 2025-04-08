import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';
import 'package:py_site/feature/resume/domain/entities/timeline_item_entity.dart';
import 'package:py_site/feature/resume/presentation/widgets/timeline.dart';

void main() {
  group('Timeline Widget', () {
    final testItem = TimelineItemEntity(
      title: 'Test Title',
      details: 'Test Details',
      dateRange: '2020 - 2022',
      isHighlighted: false,
    );

    Widget buildTestableWidget({required ThemeState themeState}) {
      return MaterialApp(
        home: BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc()..emit(themeState),
          child: Scaffold(
            body: Timeline(item: testItem),
          ),
        ),
      );
    }

    testWidgets('renders title, details, and dateRange correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        themeState: const ThemeState(isDarkMode: false),
      ));

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Details'), findsOneWidget);
      expect(find.text('2020 - 2022'), findsOneWidget);
    });

    testWidgets('uses correct circle color when highlighted',
        (WidgetTester tester) async {
      final highlightedItem = testItem.copyWith(isHighlighted: true);

      await tester.pumpWidget(MaterialApp(
        home: BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc()..emit(const ThemeState(isDarkMode: false)),
          child: Scaffold(
            body: Timeline(item: highlightedItem),
          ),
        ),
      ));

      final circleFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).shape == BoxShape.circle,
      );

      final Container circle = tester.widget(circleFinder);
      final circleColor = (circle.decoration as BoxDecoration).color;

      expect(circleColor, Colors.orange[400]);
    });

    testWidgets('uses white circle in dark mode and not highlighted',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        themeState: const ThemeState(isDarkMode: true),
      ));

      final circleFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).shape == BoxShape.circle,
      );

      final Container circle = tester.widget(circleFinder);
      final circleColor = (circle.decoration as BoxDecoration).color;

      expect(circleColor, Colors.white);
    });

    testWidgets('uses black circle in light mode and not highlighted',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        themeState: const ThemeState(isDarkMode: false),
      ));

      final circleFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).shape == BoxShape.circle,
      );

      final Container circle = tester.widget(circleFinder);
      final circleColor = (circle.decoration as BoxDecoration).color;

      expect(circleColor, Colors.black);
    });
  });
}
