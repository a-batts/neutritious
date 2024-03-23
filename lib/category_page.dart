import 'package:flutter/material.dart';
import 'package:neutritious/enums/menu_category.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.category});

  final MenuCategory category;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final MenuCategory category = widget.category;

    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(category.icon, size: 40.0),
              const SizedBox(
                width: 12.0,
              ),
              Text(category.title,
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.w600))
            ])
          ],
        ),
      )),
    );
  }
}
