import 'package:flutter/material.dart';
import 'package:py_site/feature/resume/data/repositories/project_repository_impl.dart';
import 'package:py_site/feature/resume/domain/entities/project_entity.dart';
import 'package:py_site/core/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectSection extends StatelessWidget {
  ProjectSection({super.key})
    : projects = ProjectRepositoryImpl().getProjects();

  final List<ProjectEntity> projects;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getProportionateScreenWidth(context, 20),
        vertical: Responsive.getProportionateScreenHeight(context, 10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          SizedBox(
            height: Responsive.getProportionateScreenHeight(context, 20),
          ),
          _buildProjectList(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Projects',
      style: TextStyle(
        fontSize: Responsive.getProportionateScreenWidth(context, 48),
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    );
  }

  Widget _buildProjectList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder:
          (context, index) => _buildProjectItem(context, projects[index]),
    );
  }

  Widget _buildProjectItem(BuildContext context, ProjectEntity project) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Responsive.getProportionateScreenHeight(context, 16),
      ),
      child: ListTile(
        title: Text(
          project.name,
          style: TextStyle(
            fontSize: Responsive.getProportionateScreenWidth(context, 24),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.description,
              style: TextStyle(
                fontSize: Responsive.getProportionateScreenWidth(context, 18),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [_buildGitButton(context, project.gitUrl)],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGitButton(BuildContext context, String gitUrl) {
    return ElevatedButton(
      onPressed: () async {
        final Uri url = Uri.parse(gitUrl);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      child: Text(
        'View on GitHub',
        style: TextStyle(
          fontSize: Responsive.getProportionateScreenWidth(context, 18),
        ),
      ),
    );
  }
}
