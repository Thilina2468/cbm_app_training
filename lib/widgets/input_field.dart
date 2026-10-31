import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData? icon;

  const InputField({
    super.key,
    required this.hintText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 111, 110, 110),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 111, 110, 110),
        ),
        suffixIcon: icon == null
            ? null
            : Icon(icon, color: Colors.grey, size: 22),
      ),
    );
  }
}
