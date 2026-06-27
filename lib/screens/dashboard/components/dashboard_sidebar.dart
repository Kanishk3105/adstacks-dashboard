import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/dashboard_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/nav_item_model.dart';
import '../../../models/user_model.dart';
import '../../../widgets/common/adstacks_logo.dart';
import '../../../widgets/common/user_avatar.dart';

class DashboardSidebar extends StatelessWidget {
  const DashboardSidebar({
    super.key,
    required this.selectedIndex,
    required this.onNavTap,
    this.expandedWorkspaces = true,
    this.onWorkspaceToggle,
  });

  final int selectedIndex;
  final ValueChanged<int> onNavTap;
  final bool expandedWorkspaces;
  final VoidCallback? onWorkspaceToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.sidebarWidth,
      color: AppColors.sidebarBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AdstacksLogo(),
              const SizedBox(height: 28),
              _ProfileSection(user: DashboardData.currentUser),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(DashboardData.navItems.length, (index) {
                        final item = DashboardData.navItems[index];
                        return _NavTile(
                          item: item,
                          selected: selectedIndex == index,
                          onTap: () => onNavTap(index),
                        );
                      }),
                      const SizedBox(height: 24),
                      _WorkspacesSection(
                        expanded: expandedWorkspaces,
                        onToggle: onWorkspaceToggle,
                      ),
                    ],
                  ),
                ),
              ),
              _BottomNavItem(
                icon: Icons.settings_outlined,
                label: 'Setting',
                onTap: () {},
              ),
              const SizedBox(height: 8),
              _BottomNavItem(
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(
          initials: user.initials,
          colorValue: user.avatarColor,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name, style: AppTextStyles.titleSmall),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.adminBadge,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  user.role,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final NavItemModel item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: selected ? AppColors.navSelected : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Icon(
                  selected ? item.activeIcon : item.icon,
                  size: 20,
                  color: selected ? AppColors.textPrimary : AppColors.textSecondary,
                ),
                const SizedBox(width: 12),
                Text(
                  item.label,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: selected ? AppColors.textPrimary : AppColors.textSecondary,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WorkspacesSection extends StatelessWidget {
  const _WorkspacesSection({
    required this.expanded,
    this.onToggle,
  });

  final bool expanded;
  final VoidCallback? onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('WORKSPACES', style: AppTextStyles.labelSmall),
            const Spacer(),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.add, size: 18, color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...DashboardData.workspaceItems.map(
          (name) => _WorkspaceTile(
            name: name,
            expanded: expanded,
            onTap: onToggle,
          ),
        ),
      ],
    );
  }
}

class _WorkspaceTile extends StatelessWidget {
  const _WorkspaceTile({
    required this.name,
    required this.expanded,
    this.onTap,
  });

  final String name;
  final bool expanded;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          child: Row(
            children: [
              Icon(
                expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                size: 20,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 8),
              Text(
                name,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Icon(icon, size: 20, color: AppColors.textSecondary),
              const SizedBox(width: 12),
              Text(
                label,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
