import 'package:flutter/material.dart';
import 'package:neutritious/category_page.dart';
import 'enums/menu_category.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

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
                    Column(
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
                    )
                  ],
                )),
          )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Wrap(runSpacing: 12.0, children: <Widget>[
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
            ])
          ],
        ),
      )),
    );
  }
}
