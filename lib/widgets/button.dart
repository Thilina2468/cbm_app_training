import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback onPressed;
  final bool isTransparent;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.borderRadius,
    this.isTransparent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: isTransparent
            ? Colors.transparent
            : const Color.fromARGB(255, 69, 48, 137),
        border: isTransparent
            ? Border.all(
                color: const Color.fromARGB(255, 69, 48, 137),
                width: 1.5,
              )
            : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: isTransparent
              ? const Color.fromARGB(255, 69, 48, 137)
              : Colors.white,
          textStyle: const TextStyle(fontSize: 17),
        ),
        child: Text(text),
      ),
    );
  }
}
