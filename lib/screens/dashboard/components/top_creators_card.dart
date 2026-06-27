import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/dashboard_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/creator_model.dart';
import '../../../widgets/common/dashboard_card.dart';
import '../../../widgets/common/user_avatar.dart';

class TopCreatorsCard extends StatelessWidget {
  const TopCreatorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Top Creators'),
          const SizedBox(height: 20),
          _TableHeader(),
          const SizedBox(height: 12),
          ...DashboardData.creators.map(
            (creator) => _CreatorRow(creator: creator),
          ),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Text('Name', style: _headerStyle),
        ),
        Expanded(
          flex: 3,
          child: Text('Artworks', style: _headerStyle, textAlign: TextAlign.center),
        ),
        Expanded(
          flex: 4,
          child: Text('Rating', style: _headerStyle, textAlign: TextAlign.end),
        ),
      ],
    );
  }

  TextStyle get _headerStyle => AppTextStyles.bodySmall.copyWith(
        color: AppColors.textOnDarkMuted,
        fontWeight: FontWeight.w600,
      );
}

class _CreatorRow extends StatelessWidget {
  const _CreatorRow({required this.creator});

  final CreatorModel creator;

  String get _initials {
    final parts = creator.name.split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return creator.name.substring(0, 2).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                MiniAvatar(
                  initials: _initials,
                  colorValue: creator.avatarColor,
                  size: 36,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        creator.name,
                        style: AppTextStyles.onDarkTitle.copyWith(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        creator.handle,
                        style: AppTextStyles.onDarkBody.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              NumberFormat('#,###').format(creator.artworks),
              style: AppTextStyles.onDarkTitle.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 4,
            child: RatingBar(value: creator.rating),
          ),
        ],
      ),
    );
  }
}
