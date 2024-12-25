import 'package:flutter/material.dart';

import 'animated_counter.dart';

class AnimatedCounterRow extends StatelessWidget {
  const AnimatedCounterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            AnimatedCounter(
              targetValue: 10,
              duration: Duration(seconds: 2),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text('Yıllık Tecrübe'),
          ],
        ),
        Column(
          children: [
            AnimatedCounter(
              targetValue: 3500,
              duration: Duration(seconds: 4),
            ),
            Text('Tedavi'),
          ],
        ),
        Column(
          children: [
            AnimatedCounter(
              targetValue: 1000,
              duration: Duration(seconds: 4),
            ),
            Text('Mutlu Hasta'),
          ],
        ),
      ],
    );
  }
}
