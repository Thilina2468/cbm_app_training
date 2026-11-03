import 'package:flutter/material.dart';

class BackgroundTemplate extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final double? cardHeight;
  final Widget child;

  const BackgroundTemplate({
    super.key,
    this.title,
    this.subtitle,
    this.cardHeight,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A148C),
              Color(0xFF281865),
              Color(0xFF1A1245),
            ],
          ),
        ),
        child: Container(
          width: double.infinity,
          height: cardHeight ?? 650,
          padding: const EdgeInsets.all(35),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: child,
        ),
      ),
      if (title != null || subtitle != null)
        Padding(
          padding: const EdgeInsets.only(top: 100, left: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              if (title != null)
                Text(
                  title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 10),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
        ),
    ]);
  }
}
