import 'dart:ui';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, required this.handle});
  final String text;
  final Function handle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(220, 44),
          backgroundColor: const Color(0xFF55847A)),
      onPressed: () => {handle()},
      child: Text(text),
    );
  }
}
