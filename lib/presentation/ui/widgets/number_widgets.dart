import 'package:flutter/material.dart';

class NumberWidget extends StatefulWidget {
  final int number;

  const NumberWidget({
    super.key,
    required this.number,
  });

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  bool x = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        x = true;
        count++;
        print(count);
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
          side: BorderSide(
              color: x == true ? Colors.yellowAccent : Colors.white24),
          backgroundColor: Colors.white24),
      child: Text(
        widget.number.toString(),
      ),
    );
  }
}
