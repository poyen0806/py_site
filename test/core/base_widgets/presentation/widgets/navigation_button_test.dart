import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_event.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';
import 'package:py_site/core/base_widgets/presentation/widgets/navigation_button.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState> implements ThemeBloc {}

void main() {
  late MockThemeBloc mockThemeBloc;
  late GoRouter router;

  setUp(() {
    mockThemeBloc = MockThemeBloc();

    when(() => mockThemeBloc.state).thenReturn(ThemeState(isDarkMode: false));

    router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Scaffold(
            body: BlocProvider<ThemeBloc>(
              create: (context) => mockThemeBloc,
              child: NavigationButton(
                title: 'Test Button',
                route: '/test',
              ),
            ),
          ),
        ),
        GoRoute(
          path: '/test',
          builder: (context, state) => const Scaffold(body: Text('Test Page')),
        ),
      ],
    );
  });

  Widget createWidgetUnderTest() {
    return MaterialApp.router(
      routerConfig: router,
    );
  }

  testWidgets('NavigationButton displays the correct title', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Test Button'), findsOneWidget);
  });

  testWidgets('NavigationButton navigates to the correct route on tap', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Test Page'), findsOneWidget);
  });
}
