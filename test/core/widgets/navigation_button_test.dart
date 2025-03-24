import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/widgets/navigation_button.dart';

void main() {
  testWidgets('Should render NavigationButton with correct title', (WidgetTester tester) async {
    const String testTitle = 'Test Button';
    const String testRoute = '/test';

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
          child: Scaffold(
            body: NavigationButton(
              title: testTitle,
              route: testRoute,
            ),
          ),
        ),
      ),
    );

    expect(find.byType(ElevatedButton), findsOneWidget);

    expect(find.text(testTitle), findsOneWidget);
  });
}
