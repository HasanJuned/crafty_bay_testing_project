import 'package:flutter/material.dart';

import 'number_widgets.dart';

class DesignNumberPadWidgets extends StatelessWidget {
  const DesignNumberPadWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Power Play 1',
          style: TextStyle(
              fontSize: 18, color: Colors.white, letterSpacing: 1),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 13,
          children: [
            for (int i = 0; i < 20; i++)
              NumberWidget(number: i+1),
          ],
        ),
      ],
    );
  }
}