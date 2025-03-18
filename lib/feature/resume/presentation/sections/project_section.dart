import 'package:flutter/material.dart';
import 'package:py_site/feature/resume/domain/entities/project_entity.dart';
import 'package:py_site/core/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectSection extends StatelessWidget {
  ProjectSection({super.key});

  final List<ProjectEntity> projects = [
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
    ProjectEntity(
      name: 'Project 3',
      description: 'This is a description of Project 3.',
      gitUrl: 'https://github.com/your_username/project3',
    ),
  ];

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
          // Section Title
          Text(
            'Projects',
            style: TextStyle(
              fontSize: Responsive.getProportionateScreenWidth(context, 48),
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          SizedBox(height: Responsive.getProportionateScreenHeight(context, 20)),

          // Projects List
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];

              return Padding(
                padding: EdgeInsets.only(bottom: Responsive.getProportionateScreenHeight(context, 16)),
                child: ListTile(
                  title: Text(
                    '${index + 1}. ${project.name}',
                    style: TextStyle(
                      fontSize: Responsive.getProportionateScreenWidth(context, 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.description,
                        style: TextStyle(
                          fontSize: Responsive.getProportionateScreenWidth(context, 16),
                        ),
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () async {
                          final Uri url = Uri.parse(project.gitUrl);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        child: Text(
                          project.gitUrl,
                          style: TextStyle(
                            fontSize: Responsive.getProportionateScreenWidth(context, 16),
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
