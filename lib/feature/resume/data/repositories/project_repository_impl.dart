import 'package:py_site/feature/resume/domain/entities/project_entity.dart';
import 'package:py_site/feature/resume/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  @override
  Future<List<ProjectEntity>> getProjects() async {
    return [
      ProjectEntity(
        name: 'Project 1',
        description: 'This is a description of Project 1.',
        gitUrl: 'https://github.com/your_username/project1',
      ),
      ProjectEntity(
        name: 'Project 2',
        description: 'This is a description of Project 2.',
        gitUrl: 'https://github.com/your_username/project2',
      ),
    ];
  }
}
