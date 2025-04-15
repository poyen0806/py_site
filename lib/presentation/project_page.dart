import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:py_site/core/utils/open_link.dart';
import 'package:py_site/core/utils/responsive.dart';
import 'package:py_site/feature/github_webview/data/datasources/github_remote_datasource.dart';
import 'package:py_site/feature/github_webview/data/repositories/github_webview_repository_impl.dart';
import 'package:py_site/feature/github_webview/domain/entities/github_repo_entity.dart';
import 'package:py_site/core/widgets/base_scaffold.dart';
import 'package:py_site/feature/github_webview/domain/repositories/github_webview_repository.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GitHubWebviewRepository repository = GitHubWebviewRepositoryImpl(
      remoteDatasource: GitHubRemoteDatasourceImpl(),
    );
    const userName = 'poyen0806';

    return BaseScaffold(
      body: FutureBuilder<List<GitHubRepoEntity>>(
        future: repository.getRepositories(userName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No repositories found.'));
          }

          final repositories = snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.all(
              Responsive.getProportionateScreenWidth(context, 16.0),
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: repositories.length,
            itemBuilder: (context, index) {
              final repo = repositories[index];

              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: EdgeInsets.only(
                  bottom: Responsive.getProportionateScreenHeight(context, 16),
                ),
                child: ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          repo.name,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        'updated at: ${repo.updateTime}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(
                      top: Responsive.getProportionateScreenHeight(context, 8),
                    ),
                    child: Text(
                      repo.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  children: [
                    Column(
                      children: [
                        FutureBuilder<String>(
                          future: repository.getReadme(userName, repo.name),
                          builder: (context, readmeSnapshot) {
                            if (readmeSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Padding(
                                padding: EdgeInsets.all(Responsive.getProportionateScreenWidth(context, 16.0)),
                                child: CircularProgressIndicator(),
                              );
                            } else if (readmeSnapshot.hasError) {
                              return Padding(
                                padding: EdgeInsets.all(Responsive.getProportionateScreenWidth(context, 16.0)),
                                child: Text(
                                  'Failed to load README: ${readmeSnapshot.error}',
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.all(Responsive.getProportionateScreenWidth(context, 16.0)),
                                child: MarkdownBody(
                                  data: readmeSnapshot.data ?? '',
                                ),
                              );
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                Responsive.getProportionateScreenWidth(context, 16.0),
                              ),
                              child: ElevatedButton(
                                key: Key('github_button_${repo.name}'),
                                onPressed: () => openLink(repo.htmlUrl),
                                child: Text(
                                  'View on GitHub',
                                  style: TextStyle(
                                    fontSize:
                                        Responsive.getProportionateScreenWidth(
                                          context,
                                          12,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
