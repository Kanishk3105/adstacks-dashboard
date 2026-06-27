import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/dashboard_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/analytics_data.dart';
import '../../../widgets/common/dashboard_card.dart';

class PerformanceChartCard extends StatelessWidget {
  const PerformanceChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = DashboardData.analytics;

    return LightDashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 480;
              if (compact) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Over All Performance',
                      style: AppTextStyles.headlineMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: const [
                        _LegendDot(color: AppColors.chartPink, label: 'Pending Done'),
                        _LegendDot(color: AppColors.chartPurple, label: 'Project Done'),
                      ],
                    ),
                  ],
                );
              }
              return Row(
                children: [
                  Text(
                    'Over All Performance',
                    style: AppTextStyles.headlineMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  const _LegendDot(color: AppColors.chartPink, label: 'Pending Done'),
                  const SizedBox(width: 16),
                  const _LegendDot(color: AppColors.chartPurple, label: 'Project Done'),
                ],
              );
            },
          ),
          const SizedBox(height: 28),
          SizedBox(
            height: MediaQuery.sizeOf(context).width < 600 ? 220 : 280,
            child: LineChart(_buildChartData(data)),
          ),
        ],
      ),
    );
  }

  LineChartData _buildChartData(AnalyticsData data) {
    final pendingSpots = data.points
        .map((p) => FlSpot(p.year.toDouble(), p.pending))
        .toList();
    final completedSpots = data.points
        .map((p) => FlSpot(p.year.toDouble(), p.completed))
        .toList();

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 10,
        getDrawingHorizontalLine: (value) => FlLine(
          color: AppColors.borderLight,
          strokeWidth: 1,
          dashArray: [4, 4],
        ),
      ),
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 36,
            interval: 10,
            getTitlesWidget: (value, meta) => Text(
              value.toInt().toString(),
              style: AppTextStyles.bodySmall,
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget: (value, meta) => Text(
              value.toInt().toString(),
              style: AppTextStyles.bodySmall,
            ),
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 2015,
      maxX: 2020,
      minY: 0,
      maxY: 50,
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => AppColors.darkCard,
          tooltipRoundedRadius: 8,
          getTooltipItems: (spots) => spots.map((spot) {
            return LineTooltipItem(
              '${spot.x.toInt()} • ${spot.y.toInt()}',
              AppTextStyles.bodySmall.copyWith(color: Colors.white),
            );
          }).toList(),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: pendingSpots,
          isCurved: true,
          curveSmoothness: 0.35,
          color: AppColors.chartPink,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.chartPink.withValues(alpha: 0.25),
                AppColors.chartPink.withValues(alpha: 0.02),
              ],
            ),
          ),
        ),
        LineChartBarData(
          spots: completedSpots,
          isCurved: true,
          curveSmoothness: 0.35,
          color: AppColors.chartPurple,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, bar, index) {
              if (spot.x == 2020) {
                return FlDotCirclePainter(
                  radius: 6,
                  color: Colors.white,
                  strokeWidth: 3,
                  strokeColor: AppColors.chartPurple,
                );
              }
              return FlDotCirclePainter(
                radius: 0,
                color: Colors.transparent,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.chartPurple.withValues(alpha: 0.2),
                AppColors.chartPurple.withValues(alpha: 0.02),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: AppTextStyles.bodySmall),
      ],
    );
  }
}
