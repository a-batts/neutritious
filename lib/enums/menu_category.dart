import 'package:flutter/material.dart';

enum MenuCategory {
  appetizers(
      title: "Appetizers",
      color: Colors.greenAccent,
      icon: Icons.abc,
      description: "This is a sample description"),
  entrees(title: "Entrees", color: Colors.blueAccent, icon: Icons.lunch_dining),
  sides(title: "Sides", color: Colors.indigoAccent, icon: Icons.rice_bowl),
  desserts(title: "Desserts", color: Colors.orangeAccent, icon: Icons.cake);

  const MenuCategory(
      {required this.title,
      this.description = "",
      required this.color,
      required this.icon});

  final String title;
  final String description;
  final Color color;
  final IconData icon;
}
