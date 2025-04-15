import 'package:py_site/feature/github_webview/data/datasources/github_remote_datasource.dart';
import 'package:py_site/feature/github_webview/domain/entities/github_repo_entity.dart';
import 'package:py_site/feature/github_webview/domain/repositories/github_webview_repository.dart';

class GitHubWebviewRepositoryImpl implements GitHubWebviewRepository {
  final GitHubRemoteDatasource remoteDatasource;

  GitHubWebviewRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<GitHubRepoEntity>> getRepositories(String username) async {
    return await remoteDatasource.fetchRepositories(username);
  }

  @override
  Future<String> getReadme(String username, String repoName) async {
    return await remoteDatasource.fetchReadme(username, repoName);
  }
}
