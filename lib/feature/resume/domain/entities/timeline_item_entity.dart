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

// This extension allows for easy copying of TimelineItemEntity objects
// with modified properties. It is useful for creating new instances
// based on existing ones while changing only specific attributes.
extension TimelineItemCopy on TimelineItemEntity {
  TimelineItemEntity copyWith({
    String? title,
    String? details,
    String? dateRange,
    bool? isHighlighted,
  }) {
    return TimelineItemEntity(
      title: title ?? this.title,
      details: details ?? this.details,
      dateRange: dateRange ?? this.dateRange,
      isHighlighted: isHighlighted ?? this.isHighlighted,
    );
  }
}
