import 'package:flutter/material.dart';

class Buttonstuff extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  Buttonstuff({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Colors.black26,
    );
  }
}
