import 'package:flutter/material.dart';

class IconModel {
  final IconData icon;
  final Color color;

  IconModel({required this.icon, required this.color});
}

List<IconModel> iconList = [
  IconModel(icon: Icons.home, color: Colors.blue),
  IconModel(icon: Icons.search, color: Colors.green),
  IconModel(icon: Icons.settings, color: Colors.orange),
  IconModel(icon: Icons.favorite, color: Colors.red),
  IconModel(icon: Icons.person, color: Colors.purple),
];
