import 'package:flutter/material.dart';
import 'package:neutritious/db/user_menu_item.dart';
import 'package:neutritious/profile_page.dart';

import 'category_page.dart';
import 'enums/menu_category.dart';
import 'item_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

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
                              fontWeight: FontWeight.w500,
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

  Widget _todaysTreat() {
    String title = "Set boundaries";
    String description = "Lorem ipsum";
    String imageURL =
        "https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_907,q_75,w_1100/v1/clients/virginiabeachva/144_3_3841_jpeg_18990e3e-6c17-4c58-bee7-03cb285c9dc3.jpg";

    return (SizedBox(
      width: double.infinity,
      child: Card(
          color: Colors.pinkAccent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemPage(
                        item: UserMenuItem(
                            content: description,
                            title: title,
                            imageURL: imageURL))),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "today's treat",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Image.network(
                              imageURL,
                              height: 150,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30.0,
                                  color: Colors.white),
                            ),
                            Text(
                              description,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: (SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
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
                      _todaysTreat(),
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
                                      builder: (context) =>
                                          const ProfilePage()));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0))),
                            child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "Profile",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500),
                                ))),
                      ),
                    ])
              ],
            )),
      ))),
    );
  }
}
