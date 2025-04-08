import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/feature/resume/presentation/sections/education_section.dart';
import 'package:py_site/feature/resume/presentation/widgets/timeline_section.dart';
import 'package:py_site/feature/resume/data/repositories/timeline_repository_impl.dart';

void main() {
  testWidgets('EducationSection renders with correct data', (WidgetTester tester) async {
    final educationItems = TimelineRepositoryImpl().getEducationList();

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
          child: Scaffold(
            body: EducationSection(),
          ),
        ),
      ),
    );

    expect(find.byType(TimelineSection), findsOneWidget);

    expect(find.text('Education'), findsOneWidget);

    for (final item in educationItems) {
      expect(find.text(item.title), findsOneWidget);
      expect(find.text(item.details), findsOneWidget);
      expect(find.text(item.dateRange), findsOneWidget);
    }
  });
}
