import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/feature/resume/presentation/sections/experience_section.dart';
import 'package:py_site/feature/resume/presentation/widgets/timeline_section.dart';
import 'package:py_site/feature/resume/data/repositories/timeline_repository_impl.dart';

void main() {
  testWidgets('ExperienceSection renders with correct data', (WidgetTester tester) async {
    final experienceItems = TimelineRepositoryImpl().getExperienceList();

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
          child: Scaffold(
            body: ExperienceSection(),
          ),
        ),
      ),
    );

    expect(find.byType(TimelineSection), findsOneWidget);

    expect(find.text('Experience'), findsOneWidget);

    for (final item in experienceItems) {
      expect(find.text(item.title), findsOneWidget);
      expect(find.text(item.details), findsOneWidget);
      expect(find.text(item.dateRange), findsOneWidget);
    }
  });
}
