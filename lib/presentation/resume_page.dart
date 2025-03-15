import 'package:flutter/material.dart';
import 'package:py_site/core/base_widgets/presentation/widgets/base_scaffold.dart';
import 'package:py_site/core/resume/presentation/widgets/education_section.dart';
import 'package:py_site/core/resume/presentation/widgets/hashtag_section.dart';
import 'package:py_site/core/resume/presentation/widgets/title_section.dart';
import 'package:py_site/core/resume/presentation/widgets/self_promotion_section.dart';
import 'package:py_site/core/utils/responsive.dart';

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
            // Title Section: Displays the title or heading of the page
            TitleSection(),

            // Main Section: This is the main section of the page
            // It contains some sub-sections: Hashtags and Self Promotion .etc
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section for Hashtags: This is a flex section that takes 2 parts of the available space
                  Expanded(flex: 2, child: HashtagSection()),

                  // Divider: A vertical line to visually separate the two sections
                  VerticalDivider(
                    thickness: 1,
                    width: Responsive.getProportionateScreenWidth(context, 20),
                  ),

                  // Section for Self Promotion, Education, Experience, and others: This is a flex section that takes 7 parts of the available space
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelfPromotionSection(),
                        EducationSection(),
                        // ExperienceSection(),
                        // ProjectsSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
