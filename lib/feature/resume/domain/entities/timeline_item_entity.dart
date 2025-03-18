class TimelineItemEntity {
  final String title;
  final String details;
  final String dateRange;
  final bool isHighlighted;

  TimelineItemEntity({
    required this.title,
    required this.details,
    required this.dateRange,
    this.isHighlighted = false,
  });
}
