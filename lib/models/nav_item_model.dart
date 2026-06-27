import 'package:flutter/material.dart';

class NavItemModel {
  const NavItemModel({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
}
