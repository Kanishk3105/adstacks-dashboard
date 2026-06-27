import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color scaffoldBackground = Color(0xFFF4F7FE);
  static const Color sidebarBackground = Color(0xFFFFFFFF);
  static const Color darkCard = Color(0xFF1B254B);
  static const Color darkCardSecondary = Color(0xFF111C44);
  static const Color rightPanelBackground = Color(0xFF111C44);
  static const Color primaryPurple = Color(0xFF7551FF);
  static const Color primaryPink = Color(0xFFE93B77);
  static const Color accentRed = Color(0xFFE31A1A);
  static const Color accentBlue = Color(0xFF4318FF);
  static const Color textPrimary = Color(0xFF2B3674);
  static const Color textSecondary = Color(0xFFA3AED0);
  static const Color textMuted = Color(0xFF8F9BBA);
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textOnDarkMuted = Color(0xFFA3AED0);
  static const Color navSelected = Color(0xFFF4F7FE);
  static const Color searchBackground = Color(0xFF0B1437);
  static const Color bannerGradientStart = Color(0xFF868CFF);
  static const Color bannerGradientEnd = Color(0xFF4318FF);
  static const Color projectHighlight = Color(0xFFE93B77);
  static const Color chartPurple = Color(0xFF4318FF);
  static const Color chartPink = Color(0xFFE93B77);
  static const Color calendarHighlight = Color(0xFF7551FF);
  static const Color notificationDot = Color(0xFFFFB547);
  static const Color adminBadge = Color(0xFFE9EDF7);
  static const Color graphCardBackground = Color(0xFFFFFFFF);
  static const Color borderLight = Color(0xFFE9EDF7);
  static const Color workspaceHover = Color(0xFFF4F7FE);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [bannerGradientStart, bannerGradientEnd],
  );

  static const LinearGradient bannerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF868CFF), Color(0xFF4318FF)],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [primaryPurple, primaryPink],
  );
}
