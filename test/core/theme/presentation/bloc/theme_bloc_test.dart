import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:py_site/core/theme/domain/entities/theme_entity.dart';
import 'package:py_site/core/theme/domain/repositories/theme_repository.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';

class MockThemeRepository extends Mock implements ThemeRepository {}

void main() {
  late ThemeBloc themeBloc;
  late MockThemeRepository themeRepository;

  setUp(() {
    themeRepository = MockThemeRepository();
    themeBloc = ThemeBloc(themeRepository: themeRepository);

    // Mock 初始的 theme 為 light mode
    when(() => themeRepository.loadTheme()).thenAnswer((_) async => const ThemeEntity(isDarkMode: false));
    when(() => themeRepository.saveTheme(any())).thenAnswer((_) async {});
  });

  test('Theme should be initialized with light mode', () {
    expect(themeBloc.state.theme.isDarkMode, false);
  });

  blocTest<ThemeBloc, ThemeState>(
    'Theme should be converted to dark mode when toggle event happens',
    build: () => themeBloc,
    act: (bloc) => bloc.add(ToggleThemeEvent()), // 觸發一次 toggle 事件
    expect: () => [
      predicate<ThemeState>((state) => state.theme.isDarkMode == true), // 預期轉換成 dark mode
    ],
  );

  blocTest<ThemeBloc, ThemeState>(
    'Theme should be converted to light mode when toggle event happens again',
    build: () => themeBloc,
    act: (bloc) {
      bloc.add(ToggleThemeEvent()); // 先轉換成 dark mode
      bloc.add(ToggleThemeEvent()); // 再次觸發事件，應該回到 light mode
    },
    expect: () => [
      predicate<ThemeState>((state) => state.theme.isDarkMode == true), // 第一個事件後是 dark mode
      predicate<ThemeState>((state) => state.theme.isDarkMode == false), // 第二個事件後應該回到 light mode
    ],
  );
}
