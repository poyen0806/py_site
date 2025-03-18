import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';
import 'package:py_site/core/widgets/navigation_button.dart';
import 'package:py_site/core/theme/presentation/widgets/theme_toggle_button.dart';
import 'package:py_site/router/routes.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return AppBar(
          actions: [ThemeToggleButton()],
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Spacer(),
                NavigationButton(title: 'Home', route: Routes.home),
                NavigationButton(title: 'Blog', route: Routes.blog),
                NavigationButton(title: 'Project', route: Routes.project),
              ],
            ),
          ),
        );
      },
    );
  }
}
