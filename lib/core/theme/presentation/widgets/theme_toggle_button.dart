import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_event.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(state.isDarkMode ? Icons.dark_mode : Icons.light_mode),
          onPressed: () {
            context.read<ThemeBloc>().add(
              SystemThemeChanged(
                state.isDarkMode ? Brightness.light : Brightness.dark,
              ),
            );
          },
        );
      },
    );
  }
}
