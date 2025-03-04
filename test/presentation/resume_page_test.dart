import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:py_site/core/resume/presentation/widgets/profile_section.dart';
import 'package:py_site/core/resume/presentation/widgets/skill_section.dart';
import 'package:py_site/core/theme/domain/entities/theme_entity.dart';
import 'package:py_site/core/theme/domain/repositories/theme_repository.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/widgets/theme_toggle_button.dart';
import 'package:py_site/presentation/resume_page.dart';

// 創建 MockThemeRepository 類，並模擬 loadTheme 方法
class MockThemeRepository extends Mock implements ThemeRepository {}

void main() {
  late MockThemeRepository themeRepository;

  setUp(() {
    themeRepository = MockThemeRepository();

    when(() => themeRepository.loadTheme()).thenAnswer(
      (_) async => ThemeEntity(isDarkMode: false),
    );
  });

  testWidgets('ResumePage renders correctly', (WidgetTester tester) async {
    // 提供 ThemeBloc，並傳遞 MockThemeRepository
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(themeRepository: themeRepository),
          child: ResumePage(),
        ),
      ),
    );

    // 確認 ThemeToggleButton 是否顯示在 AppBar
    expect(find.byType(ThemeToggleButton), findsOneWidget);

    // 確認 ProfileSection 是否顯示
    expect(find.byType(ProfileSection), findsOneWidget);

    // 確認 Email 是否顯示
    expect(find.text('Email: poyen@example.com'), findsOneWidget);

    // 確認 SkillSection 是否顯示
    expect(find.byType(SkillSection), findsOneWidget);
  });
}
