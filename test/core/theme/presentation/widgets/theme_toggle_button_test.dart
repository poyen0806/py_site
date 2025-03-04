import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:py_site/core/theme/domain/entities/theme_entity.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/widgets/theme_toggle_button.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState> implements ThemeBloc {}

void main() {
  late MockThemeBloc mockThemeBloc;

  setUp(() {
    // 設定 mockThemeBloc 的初始狀態
    mockThemeBloc = MockThemeBloc();
    when(() => mockThemeBloc.state).thenReturn(ThemeState(theme: ThemeEntity(isDarkMode: false))); // 預設為 light mode
  });

  // 測試 ThemeToggleButton widget 是否正確渲染
  testWidgets('ThemeToggleButton widget renders correctly', (WidgetTester tester) async {
    // 提供 mockThemeBloc 並渲染 ThemeToggleButton
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

    // 確認 ThemeToggleButton 是否渲染
    expect(find.byType(ThemeToggleButton), findsOneWidget);
  });

  // 測試 light mode 時的 icon 渲染
  testWidgets('ThemeToggleButton renders correct icon in light mode', (WidgetTester tester) async {
    // 設定 mockThemeBloc 的 state 為 light mode
    when(() => mockThemeBloc.state).thenReturn(ThemeState(theme: ThemeEntity(isDarkMode: false)));

    // 提供 mockThemeBloc 並渲染 ThemeToggleButton
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

    // 確認 light mode 的 icon
    expect(find.byIcon(Icons.light_mode), findsOneWidget);
    expect(find.byIcon(Icons.dark_mode), findsNothing);
  });

  // 測試 dark mode 時的 icon 渲染
  testWidgets('ThemeToggleButton renders correct icon in dark mode', (WidgetTester tester) async {
    // 設定 mockThemeBloc 的 state 為 dark mode
    when(() => mockThemeBloc.state).thenReturn(ThemeState(theme: ThemeEntity(isDarkMode: true)));

    // 提供 mockThemeBloc 並渲染 ThemeToggleButton
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

    // 確認 dark mode 的 icon
    expect(find.byIcon(Icons.dark_mode), findsOneWidget);
    expect(find.byIcon(Icons.light_mode), findsNothing);
  });
}
