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
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 148, 147, 147),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 88, 88, 88),
          ),
        ),
        fillColor: Colors.white,
        labelText: hintText,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 148, 147, 147),
          fontSize: 14,
        ),
        suffixIcon: icon == null
            ? null
            : Icon(icon, color: Colors.grey, size: 22),
      ),
    );
  }
}
