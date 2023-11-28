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

  void returnCount(){
    count += widget.number;
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        colorChangeDecider = true;
        returnCount();
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
