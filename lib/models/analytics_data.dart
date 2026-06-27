class AnalyticsPoint {
  const AnalyticsPoint({
    required this.year,
    required this.pending,
    required this.completed,
  });

  final int year;
  final double pending;
  final double completed;
}

class AnalyticsData {
  const AnalyticsData({required this.points});

  final List<AnalyticsPoint> points;
}
