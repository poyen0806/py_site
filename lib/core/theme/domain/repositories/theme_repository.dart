import 'package:py_site/core/theme/domain/entities/theme_entity.dart';

abstract class ThemeRepository {
  Future<void> saveTheme(bool isDarkMode);
  Future<ThemeEntity> loadTheme();
}
