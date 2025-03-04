import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:py_site/core/theme/data/data_sources/theme_local_data_source.dart';

void main() {
  late ThemeLocalDataSourceImpl themeLocalDataSource;

  setUp(() async {
    // 初始化 SharedPreferences 為測試用的實體物件
    SharedPreferences.setMockInitialValues({}); // 清空儲存空間
    themeLocalDataSource = ThemeLocalDataSourceImpl();
  });

  test('saveTheme should save the value to SharedPreferences', () async {
    // 儲存主題
    await themeLocalDataSource.saveTheme(true);

    // 讀取 SharedPreferences 來驗證儲存的資料
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool('isDarkMode');

    // 驗證儲存是否成功
    expect(result, true); // 確認結果是否為 true
  });

  test('loadTheme should load the value from SharedPreferences', () async {
    // 讀取主題
    final result = await themeLocalDataSource.loadTheme();

    // 驗證結果
    expect(result, false); // 預設為 false，若無儲存資料的情況下
  });
}
