import 'package:flutter/material.dart';

class Checklist extends StatelessWidget {
  final String text;
  final Image? image;

  const Checklist({super.key, required this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image ??
                Image.asset(
                  'assets/images/checkmark.png',
                  height: 24,
                  width: 24,
                ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
