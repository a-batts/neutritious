import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neutritious/db/database_service.dart';
import 'package:neutritious/db/user_menu_item.dart';
import 'package:neutritious/enums/menu_category.dart';
import 'package:neutritious/new_form_dialog.dart';
import 'package:neutritious/random_page.dart';

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
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemPage(item: data)),
              )
            },
            child: Row(
              children: [
                Row(
                  children: [
                    if (imageURL != null)
                      Image.network(
                        imageURL,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, e, s) => Container(),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        const SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          data.title,
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        )
                      ]),
                    ),
                  ],
                )
              ],
            ),
          )),
    ));
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  openDialog() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: NewFormDialog(
                category: widget.category,
              ),
            )).then((x) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final MenuCategory category = widget.category;
    var db = DatabaseService();

    var items = db.fetchUserMenuItems(category);

    // Select a random item and display it //
    selectRandomItem(List<UserMenuItem> items) {
      Random random = Random();
      int selectedItem = random.nextInt(items.length);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RandomPage(item: items.elementAt(selectedItem))),
      );
    }

    return Scaffold(
      body: Center(
          child: ListView(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(category.icon, size: 45.0),
                const SizedBox(
                  width: 12.0,
                ),
                Text(category.title,
                    style: const TextStyle(
                        fontSize: 45.0, fontWeight: FontWeight.w600))
              ])),
          Text(
            category.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
              runSpacing: 16.0,
              alignment: WrapAlignment.center,
              children: <Widget>[
                FutureBuilder(
                    future: items,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data?.isEmpty == true) {
                          return const SizedBox(
                              width: 600,
                              child: Card(
                                  child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text("No data"),
                              )));
                        } else {
                          var items = snapshot.data;
                          return Column(children: [
                            SizedBox(
                              width: 600.0,
                              child: FilledButton.icon(
                                  onPressed: () => selectRandomItem(items!),
                                  label: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text("RANDOM",
                                          style: TextStyle(fontSize: 22.0))),
                                  icon: const Icon(Icons.casino),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0)))),
                            ),
                            const SizedBox(height: 16.0),
                            ...items?.map((item) => _itemCard(item)) ?? []
                          ]);
                        }
                      } else {
                        return const SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Center(
                            child: SizedBox(
                              height: 48.0,
                              width: 48.0,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      }
                    }),
                SizedBox(
                  width: 600.0,
                  child: FilledButton.icon(
                      onPressed: () => openDialog(),
                      label: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("WRITE YOUR OWN",
                              style: TextStyle(fontSize: 22.0))),
                      icon: const Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)))),
                ),
              ])
        ],
      )),
    );
  }
}
