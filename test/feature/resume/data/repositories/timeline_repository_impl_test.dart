import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/feature/resume/data/repositories/timeline_repository_impl.dart';
import 'package:py_site/feature/resume/domain/entities/timeline_item_entity.dart';
import 'package:py_site/feature/resume/domain/repositories/timeline_repository.dart';

void main() {
  late TimelineRepository repository;

  setUp(() {
    repository = TimelineRepositoryImpl();
  });

  group('TimelineRepositoryImpl', () {
    test('Should return a list of education items', () {
      final educationList = repository.getEducationList();

      expect(educationList, isA<List<TimelineItemEntity>>());
    });

    test('Should return two education items', () {
      final educationList = repository.getEducationList();

      expect(educationList.length, 2);
    });

    test('Education items should contain correct details', () {
      final educationList = repository.getEducationList();

      expect(educationList[0].title, "The Affiliate Zhongli Senior High School of National University");
      expect(educationList[0].details, "Computer Science score in the top 1% of the grade");
      expect(educationList[0].dateRange, "Sep. 2019 - Jun. 2022");
      expect(educationList[0].isHighlighted, false);

      expect(educationList[1].title, "National Central University");
      expect(educationList[1].details, "BS, Computer Science and Information Engineering. \nCumulative GPA: 4.1/4.3");
      expect(educationList[1].dateRange, "Sep. 2022 - Current");
      expect(educationList[1].isHighlighted, true);
    });

    test('Should return a list of experience items', () {
      final experienceList = repository.getExperienceList();

      expect(experienceList, isA<List<TimelineItemEntity>>());
    });

    test('Should return one experience item', () {
      final experienceList = repository.getExperienceList();

      expect(experienceList.length, 1);
    });

    test('Experience item should contain correct details', () {
      final experienceList = repository.getExperienceList();

      expect(experienceList[0].title, "Teaching Assistant");
      expect(experienceList[0].details, "Programming-Python | Assisted in instruction and guided students in learning Python concepts.");
      expect(experienceList[0].dateRange, "Sep. 2024 - Current");
      expect(experienceList[0].isHighlighted, true);
    });
  });
}
