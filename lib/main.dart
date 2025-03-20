import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';
import 'package:py_site/core/utils/responsive.dart';
import 'package:py_site/core/router/app_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // Set the URL strategy for the web without "#"
  setPathUrlStrategy();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          // Currently only open for computer viewing
          return Responsive.getWidth(context) > 600
              ? MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: state.theme,
                  routerConfig: appRouter,
                )
              : MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Placeholder(),
                );
        },
      ),
    );
  }
}
