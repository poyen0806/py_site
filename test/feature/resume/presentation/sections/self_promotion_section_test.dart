import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/feature/resume/presentation/sections/self_promotion_section.dart';
import 'package:py_site/feature/resume/presentation/widgets/section_title.dart';

void main() {
  testWidgets('SelfPromotionSection renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SelfPromotionSection(),
        ),
      ),
    );

    expect(find.byType(SectionTitle), findsOneWidget);
    expect(find.text('Self Promotion'), findsOneWidget);

    expect(find.textContaining("Po-Yen Wu"), findsOneWidget);
    expect(find.textContaining("Computer Science student"), findsOneWidget);
    expect(find.textContaining("debug"), findsOneWidget);
    expect(find.textContaining("personal projects"), findsOneWidget);

    expect(find.byType(Text), findsNWidgets(2));
  });
}
