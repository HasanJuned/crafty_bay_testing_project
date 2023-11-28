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
  bool colorChangeDecider = false;
  int count = 0;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        colorChangeDecider = true;
        count += widget.number;
        print(count);
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
          side: BorderSide(
              color: colorChangeDecider == true ? Colors.yellowAccent : Colors.white24),
          backgroundColor: Colors.white24),
      child: Text(
        widget.number.toString(),
      ),
    );
  }
}
