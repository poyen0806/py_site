import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:py_site/feature/github_webview/domain/entities/github_repo_entity.dart';

abstract class GitHubRemoteDatasource {
  Future<List<GitHubRepoEntity>> fetchRepositories(String username);
  Future<String> fetchReadme(String username, String repo);
}

class GitHubRemoteDatasourceImpl implements GitHubRemoteDatasource {
  @override
  Future<List<GitHubRepoEntity>> fetchRepositories(String username) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/$username/repos?sort=updated&direction=desc'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((repo) {
        return GitHubRepoEntity(
          name: repo['name'],
          htmlUrl: repo['html_url'],
          description: repo['description'] ?? '',
          updateTime: repo['updated_at'],
        );
      }).toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }

  @override
  Future<String> fetchReadme(String username, String repo) async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/$username/$repo/main/README.md');

    final res = await http.get(url);
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return 'No README.md found or failed to load.';
    }
  }
}
