import 'package:flutter/material.dart';

class Illustration extends StatelessWidget {
  static const double _heightFraction = 0.25;

  final String asset;

  const Illustration(this.asset, {super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Image.asset(
      asset,
      height: screenHeight * _heightFraction,
      fit: BoxFit.contain,
    );
  }
}
