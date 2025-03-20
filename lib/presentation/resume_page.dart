import 'package:flutter/material.dart';
import 'package:py_site/core/widgets/base_scaffold.dart';
import 'package:py_site/feature/resume/presentation/sections/education_section.dart';
import 'package:py_site/feature/resume/presentation/sections/experience_section.dart';
import 'package:py_site/feature/resume/presentation/sections/hashtag_section.dart';
import 'package:py_site/feature/resume/presentation/sections/project_section.dart';
import 'package:py_site/feature/resume/presentation/sections/intro_section.dart';
import 'package:py_site/feature/resume/presentation/sections/self_promotion_section.dart';

/// The ResumePage is the main page for displaying the my resume.
class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Intro Section: Displays the title or heading of the page
            IntroSection(),

            // Main Section: This is the main section of the page
            // It contains some sub-sections: Hashtags and Self Promotion .etc
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section for Hashtags: This is a flex section that takes 2 parts of the available space
                Expanded(
                  flex: 23,
                  child: Card(elevation: 4.0, child: HashtagSection()),
                ),

                // Section for Self Promotion, Education, Experience, and others: This is a flex section that takes 7 parts of the available space
                Expanded(
                  flex: 77,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Self Promotion Section: This section contains a brief description of myself
                      Card(elevation: 4, child: SelfPromotionSection()),

                      // Education Section: This section contains my educational background
                      Card(elevation: 4, child: EducationSection()),

                      // Experience Section: This section contains my work experience
                      Card(elevation: 4, child: ExperienceSection()),

                      // Project Section: This section contains my projects
                      Card(elevation: 4, child: ProjectSection()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
