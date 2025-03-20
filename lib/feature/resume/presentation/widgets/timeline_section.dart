import 'package:flutter/material.dart';
import 'package:py_site/feature/resume/domain/entities/timeline_item_entity.dart';
import 'package:py_site/feature/resume/presentation/widgets/timeline.dart';
import 'package:py_site/core/utils/responsive.dart';
import 'package:py_site/feature/resume/presentation/widgets/section_title.dart';

class TimelineSection extends StatelessWidget {
  final String title;
  final List<TimelineItemEntity> items;

  const TimelineSection({super.key, required this.title, required this.items});

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
          SectionTitle(title: title),
          SizedBox(height: Responsive.getProportionateScreenHeight(context, 20)),
          ...items.map((item) => Timeline(item: item)),
        ],
      ),
    );
  }
}
