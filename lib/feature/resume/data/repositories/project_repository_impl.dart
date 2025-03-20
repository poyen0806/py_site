import 'package:py_site/feature/resume/domain/entities/project_entity.dart';
import 'package:py_site/feature/resume/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  @override
  List<ProjectEntity> getProjects() {
    return [
      ProjectEntity(
        name: 'py_site',
        description: 'This project is a personal resume and portfolio website built with Flutter, following the Clean Architecture principles. It is designed to showcase personal information, work experience, education, projects, and other professional details in an interactive and visually appealing manner.  ',
        gitUrl: 'https://github.com/poyen0806/py_site',
      ),
      ProjectEntity(
        name: 'Fact Checker Platform',
        description: 'Fact Checker Platform is a web-based tool designed to verify the authenticity of online information. Users can input an article URL, and the system will retrieve fact-checking data from the Google Fact Check API to display verification results.',
        gitUrl: 'https://github.com/poyen0806/fact-checker-platform',
      ),
    ];
  }
}
