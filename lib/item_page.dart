import 'package:flutter/material.dart';
import 'package:neutritious/content_renderer.dart';
import 'package:neutritious/db/user_menu_item.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.item, this.fit = false});

  final UserMenuItem item;
  final bool fit;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late bool _favorited;

  @override
  void initState() {
    super.initState();
    // Access widget.item to get the UserMenuItem object
    _favorited = widget.item.favorited;
  }

  _toggleFavorite() async {
    setState(() {
      _favorited = !_favorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserMenuItem item = widget.item;
    String? imageURL = item.imageURL;

    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            if (imageURL != null)
              Image.network(
                imageURL,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                fit: widget.fit ? BoxFit.fitHeight : BoxFit.cover,
                errorBuilder: (context, e, s) => Container(),
              ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title,
                                style: const TextStyle(
                                    fontSize: 42, fontWeight: FontWeight.w600)),
                            ContentRenderer(item:item)
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      if (item.favoritible)
                        IconButton(
                            color: Theme.of(context).primaryColor,
                            onPressed: _toggleFavorite,
                            icon: Icon(
                                _favorited ? Icons.star : Icons.star_outline))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 34.0),
                    child: Row(
                      children: [
                        FilledButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
