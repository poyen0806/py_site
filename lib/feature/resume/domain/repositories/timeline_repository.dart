import 'package:py_site/feature/resume/domain/entities/timeline_item_entity.dart';

abstract class TimelineRepository {
  List<TimelineItemEntity> getEducationList();
  List<TimelineItemEntity> getExperienceList();
}
