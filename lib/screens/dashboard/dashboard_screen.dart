import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive_utils.dart';
import 'components/calendar_widget.dart';
import 'components/event_widgets.dart';
import 'components/all_projects_card.dart';
import 'components/dashboard_header.dart';
import 'components/dashboard_right_panel.dart';
import 'components/dashboard_sidebar.dart';
import 'components/performance_chart_card.dart';
import 'components/project_banner.dart';
import 'components/top_creators_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedNavIndex = 0;
  bool _workspacesExpanded = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final showSidebar = ResponsiveUtils.showSidebarInline(context);
    final showRightPanel = ResponsiveUtils.showRightPanel(context);
    final padding = ResponsiveUtils.contentPadding(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.scaffoldBackground,
      drawer: showSidebar
          ? null
          : Drawer(
              width: 280,
              child: DashboardSidebar(
                selectedIndex: _selectedNavIndex,
                onNavTap: _onNavTap,
                expandedWorkspaces: _workspacesExpanded,
                onWorkspaceToggle: _toggleWorkspaces,
              ),
            ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showSidebar)
            DashboardSidebar(
              selectedIndex: _selectedNavIndex,
              onNavTap: _onNavTap,
              expandedWorkspaces: _workspacesExpanded,
              onWorkspaceToggle: _toggleWorkspaces,
            ),
          Expanded(
            child: Column(
              children: [
                DashboardHeader(
                  title: _currentTitle,
                  showMenuButton: !showSidebar,
                  onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
                ),
                if (ResponsiveUtils.isMobile(context)) const MobileSearchBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(padding, 0, padding, padding),
                    child: Column(
                      children: [
                        const ProjectBanner(),
                        SizedBox(height: padding),
                        _MiddleSection(showTwoColumns: !ResponsiveUtils.isMobile(context)),
                        SizedBox(height: padding),
                        const PerformanceChartCard(),
                        if (!showRightPanel) ...[
                          SizedBox(height: padding),
                          const _MobileRightPanelContent(),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (showRightPanel) const DashboardRightPanel(),
        ],
      ),
    );
  }

  String get _currentTitle {
    const titles = ['Home', 'Employees', 'Attendance', 'Summary', 'Information'];
    return titles[_selectedNavIndex.clamp(0, titles.length - 1)];
  }

  void _onNavTap(int index) {
    setState(() => _selectedNavIndex = index);
    if (!ResponsiveUtils.showSidebarInline(context)) {
      Navigator.of(context).pop();
    }
  }

  void _toggleWorkspaces() {
    setState(() => _workspacesExpanded = !_workspacesExpanded);
  }
}

class _MiddleSection extends StatelessWidget {
  const _MiddleSection({required this.showTwoColumns});

  final bool showTwoColumns;

  @override
  Widget build(BuildContext context) {
    if (showTwoColumns) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 900) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(child: AllProjectsCard()),
                SizedBox(width: 20),
                Expanded(child: TopCreatorsCard()),
              ],
            );
          }
          return Column(
            children: const [
              AllProjectsCard(),
              SizedBox(height: 20),
              TopCreatorsCard(),
            ],
          );
        },
      );
    }

    return const Column(
      children: [
        AllProjectsCard(),
        SizedBox(height: 20),
        TopCreatorsCard(),
      ],
    );
  }
}

class _MobileRightPanelContent extends StatelessWidget {
  const _MobileRightPanelContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.rightPanelBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'GENERAL 10:00 AM TO 7:00 PM',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textOnDarkMuted,
                  letterSpacing: 1,
                ),
          ),
          const SizedBox(height: 20),
          const DashboardRightPanelContent(),
        ],
      ),
    );
  }
}

class DashboardRightPanelContent extends StatelessWidget {
  const DashboardRightPanelContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CalendarWidget(),
        SizedBox(height: 20),
        BirthdayWidget(),
        SizedBox(height: 16),
        AnniversaryWidget(),
      ],
    );
  }
}
