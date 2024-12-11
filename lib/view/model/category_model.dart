import 'package:flutter/material.dart';

class categoryMoldel {
  final IconData icon;
  final String label;
  bool isSelected; // Tracks whether this task is selected

  categoryMoldel({
    required this.icon,
    required this.label,
    this.isSelected = false, // Default is unselected
  });
}
