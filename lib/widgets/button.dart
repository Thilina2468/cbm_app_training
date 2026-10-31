import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: const Color.fromARGB(255, 69, 48, 137)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 17),
        ),
        child: Text(text),
      ),
    );
  }
}
