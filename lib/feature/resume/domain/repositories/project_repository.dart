import 'package:py_site/feature/resume/domain/entities/project_entity.dart';

abstract class ProjectRepository {
  List<ProjectEntity> getProjects();
}