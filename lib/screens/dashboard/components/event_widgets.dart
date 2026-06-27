import 'package:flutter/material.dart';
import '../../../core/constants/dashboard_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/person_event_model.dart';
import '../../../widgets/common/dashboard_card.dart';
import '../../../widgets/common/user_avatar.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    super.key,
    required this.title,
    required this.people,
    required this.buttonLabel,
    required this.emoji,
  });

  final String title;
  final List<PersonEventModel> people;
  final String buttonLabel;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Text(
                title,
                style: AppTextStyles.onDarkTitle.copyWith(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              StackedAvatars(
                people: people
                    .map(
                      (p) => (
                        initials: _initials(p.name),
                        color: p.avatarColor,
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              Text(
                'Total | ${people.length} |',
                style: AppTextStyles.onDarkBody.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GradientButton(
            label: buttonLabel,
            icon: Icons.send_rounded,
            compact: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  String _initials(String name) {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name.substring(0, 2).toUpperCase();
  }
}

class BirthdayWidget extends StatelessWidget {
  const BirthdayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EventWidget(
      title: 'Birthday',
      people: DashboardData.birthdays,
      buttonLabel: 'Birthday Wishing',
      emoji: '🎉',
    );
  }
}

class AnniversaryWidget extends StatelessWidget {
  const AnniversaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EventWidget(
      title: 'Anniversary',
      people: DashboardData.anniversaries,
      buttonLabel: 'Anniversary Wishing',
      emoji: '🎩',
    );
  }
}
