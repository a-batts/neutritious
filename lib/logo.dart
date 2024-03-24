
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('asset/logo.png', height: 45, width: 45,),
        const SizedBox(width: 12,),
        const Text(
          "neutritious",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 45.0, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
