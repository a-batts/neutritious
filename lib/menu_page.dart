import 'package:flutter/material.dart';
import 'package:neutritious/db/user_menu_item.dart';
import 'package:neutritious/profile_page.dart';

import 'category_page.dart';
import 'enums/menu_category.dart';
import 'item_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Widget _menuItem(
    MenuCategory category,
  ) {
    Color textColor = ColorScheme.fromSeed(seedColor: category.color).onPrimary;

    return (SizedBox(
      width: double.infinity,
      child: Card(
          color: category.color,
          child: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CategoryPage(category: category)),
              )
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 22.0, vertical: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(
                        category.icon,
                        color: textColor,
                      ),
                    ),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          category.title,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                        ),
                        Text(
                          category.description,
                          style: TextStyle(color: textColor),
                        )
                      ],
                    ))
                  ],
                )),
          )),
    ));
  }

  Widget _countdownTimer() {
    DateTime event = DateTime.now().add(const Duration(days: 2));

    DateTime now = DateTime.now();
    int diffDays = event.difference(now).inDays;

    return (SizedBox(
      width: double.infinity,
      child: Card(
          color: Colors.redAccent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ItemPage(
                        item: UserMenuItem(
                            content: "Day trip with friends to Virginia Beach",
                            title: "Trip to beach",
                            imageURL:
                                "https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_907,q_75,w_1100/v1/clients/virginiabeachva/144_3_3841_jpeg_18990e3e-6c17-4c58-bee7-03cb285c9dc3.jpg"))),
              )
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 22.0, vertical: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Text(
                              diffDays.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 50.0,
                                  color: Colors.white),
                            ),
                            const Text(
                              "days",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "✨ Special",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "Trip to beach",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ))
                  ],
                )),
          )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Wrap(
                runSpacing: 12.0,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "neutritious",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 45.0, fontWeight: FontWeight.w600),
                      )),
                  const Text(
                    "MENU",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  _countdownTimer(),
                  _menuItem(
                    MenuCategory.appetizers,
                  ),
                  _menuItem(
                    MenuCategory.entrees,
                  ),
                  _menuItem(
                    MenuCategory.sides,
                  ),
                  _menuItem(
                    MenuCategory.desserts,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                        child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500),
                            ))),
                  ),
                ])
          ],
        ),
      )),
    );
  }
}
