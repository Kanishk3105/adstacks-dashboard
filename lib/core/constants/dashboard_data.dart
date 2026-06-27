import 'package:flutter/material.dart';
import '../../models/analytics_data.dart';
import '../../models/creator_model.dart';
import '../../models/nav_item_model.dart';
import '../../models/person_event_model.dart';
import '../../models/project_model.dart';
import '../../models/user_model.dart';
import '../theme/app_colors.dart';

abstract final class DashboardData {
  static const currentUser = UserModel(
    name: 'Kanishk Chhachra',
    role: 'Admin',
    avatarColor: 0xFFE93B77,
    initials: 'PM',
  );

  static const navItems = [
    NavItemModel(label: 'Home', icon: Icons.home_outlined, activeIcon: Icons.home),
    NavItemModel(label: 'Employees', icon: Icons.people_outline, activeIcon: Icons.people),
    NavItemModel(label: 'Attendance', icon: Icons.calendar_today_outlined, activeIcon: Icons.calendar_today),
    NavItemModel(label: 'Summary', icon: Icons.bar_chart_outlined, activeIcon: Icons.bar_chart),
    NavItemModel(label: 'Information', icon: Icons.info_outline, activeIcon: Icons.info),
  ];

  static const workspaceItems = ['Adstacks', 'Finance'];

  static const projects = [
    ProjectModel(
      id: 1,
      title: 'Technology behind the Blockchain',
      subtitle: 'Project #1 • See project details',
      thumbnailColor: AppColors.primaryPurple,
      isHighlighted: true,
      icon: Icons.account_balance_wallet_outlined,
    ),
    ProjectModel(
      id: 2,
      title: 'Greatest NFT & Art Marketplaces',
      subtitle: 'Project #2 • See project details',
      thumbnailColor: AppColors.accentBlue,
      isHighlighted: false,
      icon: Icons.palette_outlined,
    ),
    ProjectModel(
      id: 3,
      title: 'Office Analytics Dashboard',
      subtitle: 'Project #3 • See project details',
      thumbnailColor: AppColors.primaryPink,
      isHighlighted: false,
      icon: Icons.dashboard_outlined,
    ),
    ProjectModel(
      id: 4,
      title: 'Employee Attendance System',
      subtitle: 'Project #4 • See project details',
      thumbnailColor: AppColors.chartPurple,
      isHighlighted: false,
      icon: Icons.fact_check_outlined,
    ),
    ProjectModel(
      id: 5,
      title: 'Finance Reporting Suite',
      subtitle: 'Project #5 • See project details',
      thumbnailColor: Color(0xFF05CD99),
      isHighlighted: false,
      icon: Icons.pie_chart_outline,
    ),
  ];

  static const creators = [
    CreatorModel(
      name: 'Maddison Wilson',
      handle: '@maddison_c21',
      artworks: 9821,
      rating: 0.97,
      avatarColor: 0xFF7551FF,
    ),
    CreatorModel(
      name: 'Esther Howard',
      handle: '@esther_h',
      artworks: 8542,
      rating: 0.89,
      avatarColor: 0xFFE93B77,
    ),
    CreatorModel(
      name: 'Robert Fox',
      handle: '@robert_f',
      artworks: 7234,
      rating: 0.82,
      avatarColor: 0xFF4318FF,
    ),
    CreatorModel(
      name: 'Jenny Wilson',
      handle: '@jenny_w',
      artworks: 6102,
      rating: 0.76,
      avatarColor: 0xFF05CD99,
    ),
    CreatorModel(
      name: 'Annette Black',
      handle: '@annette_b',
      artworks: 5890,
      rating: 0.71,
      avatarColor: 0xFFFFB547,
    ),
  ];

  static const birthdays = [
    PersonEventModel(
      name: 'Rahul Sharma',
      department: 'Engineering',
      avatarColor: 0xFF7551FF,
    ),
    PersonEventModel(
      name: 'Sneha Patel',
      department: 'Design',
      avatarColor: 0xFFE93B77,
    ),
  ];

  static const anniversaries = [
    PersonEventModel(
      name: 'Amit Kumar',
      department: 'Operations',
      avatarColor: 0xFF4318FF,
    ),
    PersonEventModel(
      name: 'Priya Singh',
      department: 'HR',
      avatarColor: 0xFF05CD99,
    ),
    PersonEventModel(
      name: 'Vikram Mehta',
      department: 'Finance',
      avatarColor: 0xFFFFB547,
    ),
  ];

  static const analytics = AnalyticsData(
    points: [
      AnalyticsPoint(year: 2015, pending: 12, completed: 18),
      AnalyticsPoint(year: 2016, pending: 18, completed: 24),
      AnalyticsPoint(year: 2017, pending: 22, completed: 28),
      AnalyticsPoint(year: 2018, pending: 28, completed: 35),
      AnalyticsPoint(year: 2019, pending: 32, completed: 42),
      AnalyticsPoint(year: 2020, pending: 38, completed: 48),
    ],
  );

  static const selectedDate = 27;
  static const calendarMonth = 10;
  static const calendarYear = 2023;
}
