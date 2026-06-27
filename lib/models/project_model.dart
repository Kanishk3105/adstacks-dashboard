import 'package:flutter/material.dart';

class ProjectModel {
  const ProjectModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.thumbnailColor,
    required this.isHighlighted,
    this.icon = Icons.folder_outlined,
  });

  final int id;
  final String title;
  final String subtitle;
  final Color thumbnailColor;
  final bool isHighlighted;
  final IconData icon;
}
