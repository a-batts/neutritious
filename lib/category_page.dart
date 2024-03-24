import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neutritious/enums/menu_category.dart';
import 'package:neutritious/types/item_data.dart';

import 'item_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.category});

  final MenuCategory category;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Widget _itemCard(
    ItemData data,
  ) {
    return (SizedBox(
      width: 600,
      child: Card(
          child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () => {},
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20.0),
            child: Row(
              children: [Text(data.name)],
            )),
      )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final MenuCategory category = widget.category;

    const List<ItemData> items = [
      ItemData(
          name: "10 Jumping Jacks", description: "Lorem ipsum", imageURL: ""),
      ItemData(name: "Go Outside", description: "Lorem ipsum", imageURL: "")
    ];

    // Select a random item and display it //
    selectRandomItem() {
      Random random = Random();
      int selectedItem = random.nextInt(items.length);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ItemPage(item: items.elementAt(selectedItem))),
      );
    }

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
            ]),
            const SizedBox(height: 16.0),
            Wrap(runSpacing: 16.0, children: <Widget>[
              SizedBox(
                width: 600.0,
                child: FilledButton.icon(
                    onPressed: () => selectRandomItem(),
                    label: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child:
                            Text("RANDOM", style: TextStyle(fontSize: 22.0))),
                    icon: const Icon(Icons.casino),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)))),
              ),
              ...items.map((ItemData item) => _itemCard(item))
            ])
          ],
        ),
      )),
    );
  }
}
