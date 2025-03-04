import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/presentation/resume_page.dart';
import 'core/theme/data/data_sources/theme_local_data_source.dart';
import 'core/theme/data/repositories/theme_repository_impl.dart';
import 'core/theme/domain/repositories/theme_repository.dart';
import 'core/theme/presentation/bloc/theme_bloc.dart';

void main() {
  final themeRepository = ThemeRepositoryImpl(
    localDataSource: ThemeLocalDataSourceImpl(),
  );

  runApp(MyApp(themeRepository: themeRepository));
}

class MyApp extends StatelessWidget {
  final ThemeRepository themeRepository;

  const MyApp({super.key, required this.themeRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(themeRepository: themeRepository),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.theme.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: const ResumePage(),
          );
        },
      ),
    );
  }
}