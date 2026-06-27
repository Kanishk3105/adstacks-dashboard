import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.initials,
    required this.colorValue,
    this.size = 46,
    this.showBorder = false,
  });

  final String initials;
  final int colorValue;
  final double size;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(colorValue),
        border: showBorder
            ? Border.all(color: Colors.white, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Color(colorValue).withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: AppTextStyles.titleSmall.copyWith(
          color: Colors.white,
          fontSize: size * 0.32,
        ),
      ),
    );
  }
}

class MiniAvatar extends StatelessWidget {
  const MiniAvatar({
    super.key,
    required this.initials,
    required this.colorValue,
    this.size = 34,
  });

  final String initials;
  final int colorValue;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(colorValue),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: size * 0.34,
        ),
      ),
    );
  }
}

class StackedAvatars extends StatelessWidget {
  const StackedAvatars({
    super.key,
    required this.people,
    this.size = 36,
    this.overlap = 12,
  });

  final List<({String initials, int color})> people;
  final double size;
  final double overlap;

  @override
  Widget build(BuildContext context) {
    final totalWidth = size + (people.length - 1) * (size - overlap);
    return SizedBox(
      width: totalWidth,
      height: size,
      child: Stack(
        children: [
          for (var i = 0; i < people.length; i++)
            Positioned(
              left: i * (size - overlap),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.darkCard, width: 2),
                ),
                child: MiniAvatar(
                  initials: people[i].initials,
                  colorValue: people[i].color,
                  size: size,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
