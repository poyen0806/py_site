import 'package:flutter/material.dart';
import 'package:py_site/feature/resume/data/repositories/timeline_repository_impl.dart';
import 'package:py_site/feature/resume/domain/entities/timeline_item_entity.dart';
import 'package:py_site/feature/resume/presentation/widgets/timeline_section.dart';

class ExperienceSection extends StatelessWidget {
  ExperienceSection({super.key}) 
    : experienceList = TimelineRepositoryImpl().getExperienceList();

  final List<TimelineItemEntity> experienceList;

  @override
  Widget build(BuildContext context) {
    return TimelineSection(title: "Education", items: experienceList);
  }
}
