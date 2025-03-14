import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_event.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';
import 'package:py_site/core/theme/presentation/widgets/theme_toggle_button.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState> implements ThemeBloc {}

void main() {
  late MockThemeBloc mockThemeBloc;

  setUp(() {
    mockThemeBloc = MockThemeBloc();
    when(() => mockThemeBloc.state).thenReturn(ThemeState(isDarkMode: false));
  });

  testWidgets('ThemeToggleButton widget renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<ThemeBloc>(
            create: (_) => mockThemeBloc,
            child: ThemeToggleButton(),
          ),
        ),
      ),
    );

    expect(find.byType(ThemeToggleButton), findsOneWidget);
  });

  testWidgets('ThemeToggleButton renders correct icon in light mode', (WidgetTester tester) async {
    when(() => mockThemeBloc.state).thenReturn(ThemeState(isDarkMode: false));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<ThemeBloc>(
            create: (_) => mockThemeBloc,
            child: ThemeToggleButton(),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.light_mode), findsOneWidget);
    expect(find.byIcon(Icons.dark_mode), findsNothing);
  });

  testWidgets('ThemeToggleButton renders correct icon in dark mode', (WidgetTester tester) async {
    when(() => mockThemeBloc.state).thenReturn(ThemeState(isDarkMode: true));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<ThemeBloc>(
            create: (_) => mockThemeBloc,
            child: ThemeToggleButton(),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.dark_mode), findsOneWidget);
    expect(find.byIcon(Icons.light_mode), findsNothing);
  });
}
