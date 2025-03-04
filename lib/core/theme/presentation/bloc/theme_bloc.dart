import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/theme/domain/entities/theme_entity.dart';
import 'package:py_site/core/theme/domain/repositories/theme_repository.dart';

class ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}

class LoadThemeEvent extends ThemeEvent {}

class ThemeState {
  final ThemeEntity theme;
  ThemeState({required this.theme});
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository themeRepository;

  ThemeBloc({required this.themeRepository})
      : super(ThemeState(theme: const ThemeEntity(isDarkMode: false))) {
    on<LoadThemeEvent>((event, emit) async {
      await _loadInitialTheme(emit);
    });

    on<ToggleThemeEvent>((event, emit) async {
      final isDarkMode = !state.theme.isDarkMode;
      await themeRepository.saveTheme(isDarkMode);
      emit(ThemeState(theme: ThemeEntity(isDarkMode: isDarkMode)));
    });

    // 初始化時加載主題
    add(LoadThemeEvent());
  }

  Future<void> _loadInitialTheme(Emitter<ThemeState> emit) async {
    final theme = await themeRepository.loadTheme();
    emit(ThemeState(theme: theme));
  }
}
