import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:py_site/core/theme/data/repositories/theme_repository_impl.dart';
import 'package:py_site/core/theme/data/data_sources/theme_local_data_source.dart';

class MockThemeLocalDataSource extends Mock implements ThemeLocalDataSource {}

void main() {
  late ThemeRepositoryImpl themeRepository;
  late MockThemeLocalDataSource mockThemeLocalDataSource;

  setUp(() {
    mockThemeLocalDataSource = MockThemeLocalDataSource();
    themeRepository = ThemeRepositoryImpl(localDataSource: mockThemeLocalDataSource);
  });

  test('saveTheme should call saveTheme on localDataSource', () async {
    // 模擬 localDataSource 的 saveTheme 方法回傳 null
    when(() => mockThemeLocalDataSource.saveTheme(true)).thenAnswer((_) async {});

    await themeRepository.saveTheme(true);

    // 檢測是否有呼叫 saveTheme 方法
    verify(() => mockThemeLocalDataSource.saveTheme(true)).called(1);
  });

  test('loadTheme should return the ThemeEntity from localDataSource', () async {
    // 模擬 localDataSource 的 loadTheme 方法回傳 true
    when(() => mockThemeLocalDataSource.loadTheme()).thenAnswer((_) async => true);

    final result = await themeRepository.loadTheme();

    // 檢測是否有呼叫 loadTheme 方法
    verify(() => mockThemeLocalDataSource.loadTheme()).called(1);

    // 檢測回傳的 ThemeEntity 是否符合預期
    expect(result.isDarkMode, true);
  });
}
