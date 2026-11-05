import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._();

  static const double designWidth = 430;

  static const double fontSm = 14;
  static const double fontMd = 16;
  static const double fontXl = 24;
  static const double fontTitle = 36;

  static const double radiusMd = 16;
  static const double radiusLg = 20;
  static const double radiusXl = 24;
  static const double radiusFull = 1000;

  static const double inputHeight = 52;
  static const double buttonHeight = 56;

  static const double borderWidth = 1;
  static const double borderWidthThick = 2;

  static const double iconSm = 20;
  static const double iconMd = 24;
  static const double iconXs = 16;

  static double scale(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return (width / designWidth).clamp(0.85, 1.15).toDouble();
  }

  static double font(BuildContext context, double size) {
    return size * scale(context);
  }
}
