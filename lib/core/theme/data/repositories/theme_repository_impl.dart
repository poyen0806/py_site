import 'package:py_site/core/theme/data/data_sources/theme_local_data_source.dart';
import 'package:py_site/core/theme/domain/entities/theme_entity.dart';
import 'package:py_site/core/theme/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl({required this.localDataSource});

  @override
  Future<void> saveTheme(bool isDarkMode) async {
    await localDataSource.saveTheme(isDarkMode);
  }

  @override
  Future<ThemeEntity> loadTheme() async {
    final isDarkMode = await localDataSource.loadTheme();
    return ThemeEntity(isDarkMode: isDarkMode);
  }
}
