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
    ItemData item = widget.item;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              item.imageURL,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style: const TextStyle(
                          fontSize: 42, fontWeight: FontWeight.w600)),
                  Text(item.description),
                  Padding(
                    padding: const EdgeInsets.only(top: 34.0),
                    child: Row(
                      children: [
                        FilledButton.icon(
                            onPressed: () => {},
                            icon: const Icon(Icons.arrow_back_rounded),
                            label: const Text("Back"),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0)))),
                        const Spacer(),
                        FilledButton.icon(
                            onPressed: () => {},
                            icon: const Icon(Icons.check),
                            label: const Text("I did it!"),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0))))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
