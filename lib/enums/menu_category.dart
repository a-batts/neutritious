import 'package:flutter/material.dart';

enum MenuCategory {
  appetizers(
      collection: 'appetizers',
      title: "Appetizers",
      color: Colors.greenAccent,
      icon: Icons.tapas,
      description: "Quick activities to give you a boost."),
  entrees(
      collection: 'entrees',
      title: "Entrees",
      color: Colors.blueAccent,
      icon: Icons.lunch_dining,
      description:
          "Longer activities that contribute to a healthy and productive lifestyle while boosting dopamine levels."),
  sides(
      collection: 'sides',
      title: "Sides",
      color: Colors.indigoAccent,
      icon: Icons.rice_bowl,
      description:
          "Supplemental activities to make boring tasks more palatable."),
  desserts(
      collection: 'desserts',
      title: "Desserts",
      color: Colors.orangeAccent,
      icon: Icons.cake,
      description:
          "Activities that are easy to overdo, but are great in moderation.");

  const MenuCategory(
      {required this.title,
      this.description = "",
      required this.color,
      required this.icon,
      required this.collection});

  final String title;
  final String collection;
  final String description;
  final Color color;
  final IconData icon;
}
