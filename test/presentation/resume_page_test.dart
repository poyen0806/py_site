import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/widgets/base_scaffold.dart';
import 'package:py_site/feature/resume/presentation/sections/education_section.dart';
import 'package:py_site/feature/resume/presentation/sections/experience_section.dart';
import 'package:py_site/feature/resume/presentation/sections/hashtag_section.dart';
import 'package:py_site/feature/resume/presentation/sections/intro_section.dart';
import 'package:py_site/feature/resume/presentation/sections/project_section.dart';
import 'package:py_site/feature/resume/presentation/sections/self_promotion_section.dart';
import 'package:py_site/presentation/resume_page.dart';

void main() {
  group('ResumePage Widget Tests (Using Real Bloc)', () {
    testWidgets('should render all sections and basic layout correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
         BlocProvider<ThemeBloc>(
           create: (_) => ThemeBloc(),
           child: MaterialApp(
            home: const ResumePage(),
           ),
         ),
      );

      expect(find.byType(BaseScaffold), findsOneWidget);
      expect(find.byType(IntroSection), findsOneWidget);
      expect(find.byType(HashtagSection), findsOneWidget);
      expect(find.byType(SelfPromotionSection), findsOneWidget);
      expect(find.byType(EducationSection), findsOneWidget);
      expect(find.byType(ExperienceSection), findsOneWidget);
      expect(find.byType(ProjectSection), findsOneWidget);
      expect(find.byType(Card), findsNWidgets(5));
    });
  });
}