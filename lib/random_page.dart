import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neutritious/db/user_menu_item.dart';

import 'item_page.dart';

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

  var dice = [
    const AssetImage('/asset/dice/dice0.png'),
    const AssetImage('/asset/dice/dice1.png'),
    const AssetImage('/asset/dice/dice2.png'),
    const AssetImage('/asset/dice/dice3.png'),
    const AssetImage('/asset/dice/dice4.png'),
    const AssetImage('/asset/dice/dice5.png'),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

      _a = Tween(begin: 0.0, end: 19.99).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
      _diceAnimation = Tween(begin: 0.0, end: 5.99).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

      _animationController.forward().then((value) {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ItemPage(item: widget.item)),
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
    var a = _a.value - _a.value.floor();
    var yy = Random(_a.value.floor()).nextDouble() - 0.5 + a;
    var xx = Random(-_a.value.floor()).nextDouble() -0.5 + a;

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
                    Transform.translate(
                      offset: Offset(10 * xx, 10 * yy),
                      child: Image(image: dice[_diceAnimation.value.floor()], height: 200, width: 200,),
                      ),
                  ]))),
    );
  }
}
