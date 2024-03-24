import 'package:flutter/material.dart';
import 'package:neutritious/db/user_menu_item.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.item});

  final UserMenuItem item;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    UserMenuItem item = widget.item;
    String? imageURL = item.imageURL;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (imageURL != null)
              Image.network(
                imageURL,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.cover,
                errorBuilder: (context, e, s) => Container(),
              ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title,
                      style: const TextStyle(
                          fontSize: 42, fontWeight: FontWeight.w600)),
                  Text(item.content),
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
