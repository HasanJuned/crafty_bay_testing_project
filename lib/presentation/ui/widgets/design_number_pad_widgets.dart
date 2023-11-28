import 'package:flutter/material.dart';

import 'number_widgets.dart';

class DesignNumberPadWidgets extends StatelessWidget {
  DesignNumberPadWidgets({
    super.key, required this.playNumber,
  });
  final int playNumber;
  int count = 0;
  List<int> countAdditions = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Player Number ${playNumber.toString()}',
          style: const TextStyle(
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