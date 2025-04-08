import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';
import 'package:py_site/feature/resume/domain/entities/timeline_item_entity.dart';
import 'package:py_site/feature/resume/presentation/widgets/timeline_section.dart';

void main() {
  group('TimelineSection Widget', () {
    final items = [
      TimelineItemEntity(
        title: 'Title 1',
        details: 'Details 1',
        dateRange: '2020 - 2021',
        isHighlighted: false,
      ),
      TimelineItemEntity(
        title: 'Title 2',
        details: 'Details 2',
        dateRange: '2022 - 2023',
        isHighlighted: true,
      ),
    ];

    Widget buildTestableWidget({
      required ThemeState themeState,
      required List<TimelineItemEntity> items,
    }) {
      return MaterialApp(
        home: BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc()..emit(themeState),
          child: Scaffold(
            body: TimelineSection(title: 'My Section', items: items),
          ),
        ),
      );
    }

    testWidgets('renders section title and all timeline items',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        themeState: const ThemeState(isDarkMode: false),
        items: items,
      ));

      expect(find.text('My Section'), findsOneWidget);

      expect(find.text('Title 1'), findsOneWidget);
      expect(find.text('Details 1'), findsOneWidget);
      expect(find.text('2020 - 2021'), findsOneWidget);

      expect(find.text('Title 2'), findsOneWidget);
      expect(find.text('Details 2'), findsOneWidget);
      expect(find.text('2022 - 2023'), findsOneWidget);
    });
  });
}
