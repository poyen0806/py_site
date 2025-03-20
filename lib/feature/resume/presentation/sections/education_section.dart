import 'package:flutter/material.dart';
import 'package:py_site/feature/resume/data/repositories/timeline_repository_impl.dart';
import 'package:py_site/feature/resume/domain/entities/timeline_item_entity.dart';
import 'package:py_site/feature/resume/presentation/widgets/timeline_section.dart';

class EducationSection extends StatelessWidget {
  EducationSection({super.key}) 
    : educationList = TimelineRepositoryImpl().getEducationList();

  final List<TimelineItemEntity> educationList;

  @override
  Widget build(BuildContext context) {
    return TimelineSection(title: "Education", items: educationList);
  }
}
