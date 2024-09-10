import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  //variable for buttons
  final String text;
  VoidCallback onPress;

  MyButton({required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Text(text),
      color: Colors.yellow,
    );
  }
}
