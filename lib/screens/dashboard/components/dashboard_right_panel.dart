import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'calendar_widget.dart';
import 'event_widgets.dart';

class DashboardRightPanel extends StatelessWidget {
  const DashboardRightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.rightPanelWidth,
      color: AppColors.rightPanelBackground,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _OfficeHoursHeader(),
              SizedBox(height: 20),
              CalendarWidget(),
              SizedBox(height: 20),
              BirthdayWidget(),
              SizedBox(height: 16),
              AnniversaryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _OfficeHoursHeader extends StatelessWidget {
  const _OfficeHoursHeader();

  @override
  Widget build(BuildContext context) {
    return Text(
      AppConstants.officeHours,
      style: AppTextStyles.labelSmall.copyWith(
        color: AppColors.textOnDarkMuted,
        letterSpacing: 1.0,
      ),
    );
  }
}
