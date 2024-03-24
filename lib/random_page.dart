import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neutritious/db/user_menu_item.dart';

import 'item_page.dart';

double sigmoid(double x) => 1 / (1 + exp(-x));

class RandomPage extends StatefulWidget {
  const RandomPage({super.key, required this.item});

  final UserMenuItem item;

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _a;
  late Animation<double> _diceAnimation;

  var dice = <Widget>[
    Image.asset(
      'asset/dice/dice0.png',
      height: 20,
      width: 20,
    ),
    Image.asset(
      'asset/dice/dice1.png',
      height: 20,
      width: 20,
    ),
    Image.asset(
      'asset/dice/dice2.png',
      height: 20,
      width: 20,
    ),
    Image.asset(
      'asset/dice/dice3.png',
      height: 20,
      width: 20,
    ),
    Image.asset(
      'asset/dice/dice4.png',
      height: 20,
      width: 20,
    ),
    Image.asset(
      'asset/dice/dice5.png',
      height: 20,
      width: 20,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _a = Tween(begin: 0.0, end: 6.28 * 2).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animationController.forward().then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ItemPage(item: widget.item)),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Randomizing...",
                        style: TextStyle(
                            fontSize: 42, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 200,
                      width: 375,
                      child: Row(
                        children: dice.indexed
                            .map<Widget>((x) => Padding(
                                padding: const EdgeInsets.only(right: 20, left: 20),
                                child: Transform.translate(
                                  offset: Offset(0.0,
                                      50.0 * (sin(_a.value + x.$1 / 3.14))),
                                  child: x.$2,
                                )))
                            .toList(),
                      ),
                    )
                  ]))),
    );
  }
}
