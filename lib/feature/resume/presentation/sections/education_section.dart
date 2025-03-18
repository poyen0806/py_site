import 'package:flutter/material.dart';
import 'package:py_site/feature/resume/domain/entities/timeline_item_entity.dart';
import 'package:py_site/feature/resume/presentation/widgets/timeline.dart';
import 'package:py_site/core/utils/responsive.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TimelineItemEntity> educationList = [
      TimelineItemEntity(
        title:
            "The Affiliate Zhongli Senior High School of National University",
        details: "Computer Science score in the top 1% of the grade",
        dateRange: "Sep. 2019 - Jun. 2022",
        isHighlighted: false,
      ),
      TimelineItemEntity(
        title: "National Central University",
        details:
            "BS, Computer Science and Information Engineering. \nCumulative GPA: 4.1/4.3",
        dateRange: "Sep. 2022 - Current",
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
          // Education Title
          Text(
            "Education",
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

          // Education Details
          ...educationList.map((item) => Timeline(item: item)),
        ],
      ),
    );
  }
}
