import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/core/widgets/base_app_bar.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/widgets/base_scaffold.dart';

void main() {
  group('BaseScaffold Widget Test', () {
    testWidgets('Should display Scaffold with BaseAppBar and body', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ThemeBloc>(
            create: (_) => ThemeBloc(),
            child: const BaseScaffold(
              body: Text('Test Body'),
            ),
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);

      expect(find.byType(BaseAppBar), findsOneWidget);

      expect(find.text('Test Body'), findsOneWidget);
    });

    testWidgets('Should display floatingActionButton when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ThemeBloc>(
            create: (_) => ThemeBloc(),
            child: const BaseScaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: null,
                child: Icon(Icons.add),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('Should have correct padding when contentPadding is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ThemeBloc>(
            create: (_) => ThemeBloc(),
            child: const BaseScaffold(
              contentPadding: true,
              bottomPadding: 50.0,
              body: Text('Test Body'),
            ),
          ),
        ),
      );

      final listView = tester.widget<ListView>(find.byType(ListView));

      expect(listView.padding, isNotNull);
    });

    testWidgets('Should have no padding when contentPadding is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ThemeBloc>(
            create: (_) => ThemeBloc(),
            child: const BaseScaffold(
              contentPadding: false,
              body: Text('No Padding'),
            ),
          ),
        ),
      );

      final listView = tester.widget<ListView>(find.byType(ListView));

      expect(listView.padding, isNull);
    });
  });
}
