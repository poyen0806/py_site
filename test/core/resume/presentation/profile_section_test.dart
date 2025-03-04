import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/core/resume/presentation/widgets/profile_section.dart';

void main() {
  testWidgets('ProfileSection renders correctly', (WidgetTester tester) async {
    // 渲染 ProfileSection widget
    await tester.pumpWidget(MaterialApp(home: ProfileSection()));

    // 確認 CircleAvatar 和文字是否顯示
    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.text('PoYen'), findsOneWidget);
    expect(find.text('Student / Developer'), findsOneWidget);

    // 檢查 CircleAvatar 的背景圖片是否正確
    final avatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
    expect(avatar.backgroundImage, isA<AssetImage>());
    expect((avatar.backgroundImage as AssetImage).assetName, 'assets/images/profile.png');
  });
}
