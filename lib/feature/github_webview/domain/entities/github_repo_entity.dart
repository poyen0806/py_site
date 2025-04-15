class GitHubRepoEntity {
  final String name;
  final String htmlUrl;
  final String description;
  final String updateTime;

  const GitHubRepoEntity({
    required this.name,
    required this.htmlUrl,
    required this.description,
    required this.updateTime,
  });
}
