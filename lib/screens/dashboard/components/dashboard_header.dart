import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/dashboard_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../widgets/common/user_avatar.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    super.key,
    required this.title,
    this.onMenuTap,
    this.showMenuButton = false,
  });

  final String title;
  final VoidCallback? onMenuTap;
  final bool showMenuButton;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return SizedBox(
      height: AppConstants.headerHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.contentPadding(context),
        ),
        child: Row(
          children: [
            if (showMenuButton) ...[
              IconButton(
                onPressed: onMenuTap,
                icon: const Icon(Icons.menu),
                color: AppColors.textPrimary,
              ),
              const SizedBox(width: 4),
            ],
            if (!isMobile)
              Text(title, style: AppTextStyles.displayLarge.copyWith(fontSize: 34))
            else
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.headlineLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (!isMobile) ...[
              const Spacer(),
              SizedBox(
                width: isMobile ? 180 : 320,
                child: _SearchField(),
              ),
              const Spacer(),
            ],
            if (isMobile) const Spacer(),
            _HeaderIconButton(icon: Icons.edit_note_outlined, onTap: () {}),
            const SizedBox(width: 8),
            _NotificationButton(),
            const SizedBox(width: 8),
            _HeaderIconButton(icon: Icons.power_settings_new, onTap: () {}),
            const SizedBox(width: 12),
            UserAvatar(
              initials: DashboardData.currentUser.initials,
              colorValue: DashboardData.currentUser.avatarColor,
              size: 41,
            ),
          ],
        ),
      ),
    );
  }
}

class MobileSearchBar extends StatelessWidget {
  const MobileSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: _SearchField(),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.textOnDarkMuted.withValues(alpha: 0.8),
          size: 20,
        ),
        filled: true,
        fillColor: AppColors.searchBackground,
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.sidebarBackground,
      borderRadius: BorderRadius.circular(12),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 41,
          height: 41,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
              ),
            ],
          ),
          child: Icon(icon, size: 20, color: AppColors.textSecondary),
        ),
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _HeaderIconButton(icon: Icons.notifications_none, onTap: () {}),
        Positioned(
          top: 8,
          right: 10,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.notificationDot,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
