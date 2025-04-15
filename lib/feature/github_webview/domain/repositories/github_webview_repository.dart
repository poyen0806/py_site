import 'package:py_site/feature/github_webview/domain/entities/github_repo_entity.dart';

abstract class GitHubWebviewRepository {
  Future<List<GitHubRepoEntity>> getRepositories(String username);
  Future<String> getReadme(String username, String repoName);
}
