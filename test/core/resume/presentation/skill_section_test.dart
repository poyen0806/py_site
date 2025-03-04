import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/core/resume/presentation/widgets/skill_section.dart';

void main() {
  testWidgets('SkillSection renders correctly', (WidgetTester tester) async {
    // 渲染 SkillSection widget
    await tester.pumpWidget(MaterialApp(home: SkillSection()));

    // 確認文字是否顯示
    expect(find.text('Skills:'), findsOneWidget);
    expect(find.text('• Flutter • Dart • Clean Architecture'), findsOneWidget);
    expect(find.text('• Firebase • Git • UI/UX Design'), findsOneWidget);
  });
}
