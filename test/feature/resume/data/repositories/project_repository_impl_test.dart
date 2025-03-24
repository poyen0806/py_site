import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/feature/resume/data/repositories/project_repository_impl.dart';
import 'package:py_site/feature/resume/domain/entities/project_entity.dart';
import 'package:py_site/feature/resume/domain/repositories/project_repository.dart';

void main() {
  late ProjectRepository repository;

  setUp(() {
    repository = ProjectRepositoryImpl();
  });

  group('ProjectRepositoryImpl', () {
    test('Should return a list of ProjectEntity', () {
      final projects = repository.getProjects();

      expect(projects, isA<List<ProjectEntity>>());
    });

    test('Should return two projects', () {
      final projects = repository.getProjects();

      expect(projects.length, 2);
    });

    test('Should contain correct project details', () {
      final projects = repository.getProjects();

      expect(projects[0].name, 'py_site');
      expect(projects[0].description.contains('personal resume'), isTrue);
      expect(projects[0].gitUrl, 'https://github.com/poyen0806/py_site');

      expect(projects[1].name, 'Fact Checker Platform');
      expect(projects[1].description.contains('Google Fact Check API'), isTrue);
      expect(projects[1].gitUrl, 'https://github.com/poyen0806/fact-checker-platform');
    });
  });
}
