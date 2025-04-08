import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/feature/resume/presentation/sections/hashtag_section.dart';

void main() {
  testWidgets('HashtagSection renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HashtagSection(),
        ),
      ),
    );

    expect(find.text('About Me'), findsOneWidget);

    final hashtags = [
      '# self-driven',
      '# team-player',
      '# coding-in-life',
      '# always-learning',
      '# debug-master',
    ];

    for (final tag in hashtags) {
      expect(find.text(tag), findsOneWidget);
    }

    expect(find.byType(Hashtag), findsNWidgets(hashtags.length));
  });
}
