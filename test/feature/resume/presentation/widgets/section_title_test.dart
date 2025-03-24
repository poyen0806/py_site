import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/feature/resume/presentation/widgets/section_title.dart';

void main() {
  testWidgets('SectionTitle displays the title and has correct styles', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SectionTitle(title: 'Test Title'),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);

    final textWidget = tester.widget<Text>(find.text('Test Title'));
    expect(textWidget.style?.fontWeight, FontWeight.bold);
    expect(textWidget.style?.letterSpacing, 2);
  });
}
