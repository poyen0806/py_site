import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/resume/presentation/widgets/title_section.dart';
import 'package:py_site/core/resume/presentation/widgets/self_promotion_section.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/widgets/theme_toggle_button.dart';
import 'package:py_site/presentation/resume_page.dart';

void main() {
  testWidgets('ResumePage renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
          child: ResumePage(),
        ),
      ),
    );

    expect(find.byType(ThemeToggleButton), findsOneWidget);

    expect(find.byType(TitleSection), findsOneWidget);

    expect(find.text('Email: poyen@example.com'), findsOneWidget);

    expect(find.byType(SelfPromotionSection), findsOneWidget);
  });
}
