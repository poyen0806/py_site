import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/feature/resume/data/repositories/project_repository_impl.dart';
import 'package:py_site/feature/resume/presentation/sections/project_section.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  group('ProjectSection', () {
    testWidgets('renders title correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ThemeBloc>(
            create: (_) => ThemeBloc(),
            child: Scaffold(body: ProjectSection()),
          ),
        ),
      );

      expect(find.text('Projects'), findsOneWidget);
    });

    testWidgets('renders project list correctly', (WidgetTester tester) async {
      final projects = ProjectRepositoryImpl().getProjects();

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ThemeBloc>(
            create: (_) => ThemeBloc(),
            child: Scaffold(body: ProjectSection()),
          ),
        ),
      );

      expect(find.byType(ListTile), findsNWidgets(projects.length));
      for (final project in projects) {
        expect(find.text(project.name), findsOneWidget);
        expect(find.text(project.description), findsOneWidget);
      }
    });

    testWidgets('renders GitHub button and launches URL', (
      WidgetTester tester,
    ) async {
      final projects = ProjectRepositoryImpl().getProjects();

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ThemeBloc>(
            create: (_) => ThemeBloc(),
            child: Scaffold(body: ProjectSection()),
          ),
        ),
      );

      final gitButton = find.byKey(Key('github_button_${projects[0].name}'));
      expect(gitButton, findsOneWidget);

      await tester.tap(gitButton);
      await tester.pump();

      expect(() => launchUrl(Uri.parse(projects[0].gitUrl)),
          returnsNormally,
          reason: 'Should launch the URL',
      );
    });
  });
}
