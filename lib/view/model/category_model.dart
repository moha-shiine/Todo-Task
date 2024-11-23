import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:taskapp/color/them.dart';

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

List<categoryMoldel> taskList = [
  categoryMoldel(icon: Icons.filter_alt, label: "All task"),
  categoryMoldel(icon: Icons.done, label: "Completed"),
  categoryMoldel(icon: Icons.pending, label: "Pending"),
  categoryMoldel(icon: Icons.cancel, label: "Cancelled"),
];
