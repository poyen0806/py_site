import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';

/// Navigation button generator
class NavigationButton extends StatelessWidget {
  final String title;
  final String route;

  const NavigationButton({
    super.key,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () => GoRouter.of(context).go(route),
            child: Text(title),
          ),
        );
      },
    );
  }
}
