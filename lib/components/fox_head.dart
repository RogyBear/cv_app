import 'package:flutter/material.dart';

class FoxHead extends StatelessWidget {
  const FoxHead({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 50,
      child: Image(
        image: AssetImage(
          'assets/images/foxHead.png',
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
