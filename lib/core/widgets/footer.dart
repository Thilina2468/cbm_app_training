import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';

class Footer extends StatelessWidget {
  final Widget child;

  const Footer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpace.s32,
        AppSpace.s32,
        AppSpace.s32,
        AppSpace.s32,
      ),
      child: child,
    );
  }
}
