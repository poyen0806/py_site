import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/core/theme/presentation/widgets/theme_toggle_button.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/widgets/base_app_bar.dart';
import 'package:py_site/core/widgets/navigation_button.dart';

void main() {
  testWidgets('BaseAppBar has a title and navigation buttons', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
          child: Scaffold(
            appBar: BaseAppBar(),
          ),
        ),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    
    expect(find.byType(ThemeToggleButton), findsOneWidget);

    expect(find.byType(NavigationButton), findsNWidgets(3));
  });
}