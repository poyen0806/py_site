import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeLocalDataSource {
  Future<void> saveTheme(bool isDarkMode);
  Future<bool> loadTheme();
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  static const String themeKey = "isDarkMode";

  @override
  Future<void> saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeKey, isDarkMode);
  }

  @override
  Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeKey) ?? false; // 預設為淺色模式
  }
}
