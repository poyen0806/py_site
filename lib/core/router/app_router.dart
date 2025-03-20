import 'package:go_router/go_router.dart';
import 'package:py_site/core/router/routes.dart';
import 'package:py_site/presentation/resume_page.dart';
// import 'package:py_site/presentation/blog_page.dart';
// import 'package:py_site/presentation/project_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const ResumePage(),
    ),
    GoRoute(
      path: Routes.blog,
      builder: (context, state) => const ResumePage(), // BlogPage()
    ),
    GoRoute(
      path: Routes.project,
      builder: (context, state) => const ResumePage(), // ProjectPage()
    ),
  ],
);
