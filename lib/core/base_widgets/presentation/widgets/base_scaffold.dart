import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/base_widgets/presentation/widgets/base_app_bar.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';
import 'package:py_site/core/utils/responsive.dart';

/// Base scaffold for all pages
class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    this.body,
    this.floatingActionButton,
    this.bottomPadding = 50.0,
    this.contentPadding = true,
  });

  final Widget? body;
  final Widget? floatingActionButton;
  final double bottomPadding;
  final bool contentPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final sidePadding = Responsive.getProportionateScreenWidth(context, 32);

        return Scaffold(
          appBar: const BaseAppBar(),
          floatingActionButton: floatingActionButton,
          body: ListView(
            padding: contentPadding
                ? EdgeInsets.only(
                    left: sidePadding,
                    right: sidePadding,
                    bottom: bottomPadding,
                  )
                : null,
            children: [body ?? Container()],
          ),
        );
      },
    );
  }
}
