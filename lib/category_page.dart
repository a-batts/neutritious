import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neutritious/db/user_menu_item.dart';
import 'package:neutritious/enums/menu_category.dart';

import 'item_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.category});

  final MenuCategory category;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Widget _itemCard(
    UserMenuItem data,
  ) {
    String? imageURL = data.imageURL;

    return (SizedBox(
      width: 600,
      child: Card(
          child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ItemPage(item: data)),
          )
        },
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20.0),
            child: Row(
              children: [
                Row(
                  children: [
                    if(imageURL != null)
                    Image.network(
                      imageURL,
                      width: 100,
                      height: 100,
                    ) else const SizedBox(width: 100, height: 100,),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      data.title,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            )),
      )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final MenuCategory category = widget.category;

    const List<UserMenuItem> items = [
      UserMenuItem(
          title: "10 Jumping Jacks",
          content: "Lorem ipsum",
          imageURL:
              "https://upload.wikimedia.org/wikipedia/en/thumb/3/3b/SpongeBob_SquarePants_character.svg/1200px-SpongeBob_SquarePants_character.svg.png"
              ),
      UserMenuItem(
          title: "Go Outside",
          content: "Lorem ipsum",
          imageURL:
              "https://upload.wikimedia.org/wikipedia/en/thumb/7/79/Squidward_Tentacles_%28fair_use%29.svg/1200px-Squidward_Tentacles_%28fair_use%29.svg.png"),
      UserMenuItem(
          title: "Go Outside",
          content: "Lorem ipsum",
          )    ];

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
              ...items.map((item) => _itemCard(item))
            ])
          ],
        ),
      )),
    );
  }
}
