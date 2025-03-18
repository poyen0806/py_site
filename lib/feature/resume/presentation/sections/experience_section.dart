import 'package:flutter/material.dart';
import 'package:py_site/feature/resume/domain/entities/timeline_item_entity.dart';
import 'package:py_site/feature/resume/presentation/widgets/timeline.dart';
import 'package:py_site/core/utils/responsive.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TimelineItemEntity> experienceList = [
      TimelineItemEntity(
        title: "Teaching Assistant",
        details: "Programming-Python | Assisted in instruction and guided students in learning Python concepts.",
        dateRange: "Sep. 2024 - Current",
        isHighlighted: true,
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getProportionateScreenWidth(context, 20),
        vertical: Responsive.getProportionateScreenHeight(context, 10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Experience Title
          Text(
            "Experience",
            style: TextStyle(
              fontSize: Responsive.getProportionateScreenWidth(context, 48),
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          // Spacer
          SizedBox(
            height: Responsive.getProportionateScreenHeight(context, 20),
          ),

          // Experience Details
          ...experienceList.map((item) => Timeline(item: item)),
        ],
      ),
    );
  }
}
