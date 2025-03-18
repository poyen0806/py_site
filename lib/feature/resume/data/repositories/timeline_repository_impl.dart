import 'package:py_site/feature/resume/domain/entities/timeline_item_entity.dart';
import 'package:py_site/feature/resume/domain/repositories/timeline_repository.dart';

class TimelineRepositoryImpl implements TimelineRepository {
  @override
  List<TimelineItemEntity> getEducationList() {
    return [
      TimelineItemEntity(
        title: "The Affiliate Zhongli Senior High School of National University",
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
  }

  @override
  List<TimelineItemEntity> getExperienceList() {
    return [
      TimelineItemEntity(
        title: "Teaching Assistant",
        details: "Programming-Python | Assisted in instruction and guided students in learning Python concepts.",
        dateRange: "Sep. 2024 - Current",
        isHighlighted: true,
      ),
    ];
  }
}
