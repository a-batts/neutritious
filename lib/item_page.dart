import 'package:flutter/material.dart';
import 'package:neutritious/types/item_data.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.item});

  final ItemData item;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[],
        ),
      )),
    );
  }
}
