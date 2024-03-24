import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neutritious/db/database_service.dart';
import 'package:neutritious/db/user_menu_item.dart';
import 'package:neutritious/enums/menu_category.dart';
import 'package:neutritious/new_form_dialog.dart';
import 'package:neutritious/random_page.dart';
import 'package:neutritious/snake_game.dart';

import 'item_page.dart';

class ContentRenderer extends StatefulWidget {
  const ContentRenderer({super.key, required this.item});

  final UserMenuItem item;

  @override
  State<ContentRenderer> createState() => _ContentRendererState();
}

class _ContentRendererState extends State<ContentRenderer> {
  @override
  Widget build(BuildContext context) {
    if (widget.item.id == 'snake') {
      return SnakeGameWidget();
    } else {
      return Text(widget.item.content);
    }
  }
}
