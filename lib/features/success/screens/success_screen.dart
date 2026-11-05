import 'package:kyc_practice_app/features/auth/screens/login_screen.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  static const double _contentHeight = 650;
  static const double _confettiWidth = 120;

  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          BackgroundTemplate(
            footer: Button(
              text: "Let’s Go",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            ),
            child: const SizedBox.shrink(),
          ),
          Container(
            width: double.infinity,
            height: _contentHeight,
            padding: const EdgeInsets.all(AppSpace.s40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/confetti.png',
                  width: _confettiWidth,
                ),
                AppSpace.h40,
                Text(
                  'Yay, you’ve joined My CBM!',
                  style: AppStyles.heading(context),
                ),
                AppSpace.h20,
                Text(
                  'You can explore My CBM with limited features while we review your information. Full access will be granted upon verification.',
                  textAlign: TextAlign.center,
                  style: AppStyles.subtitle(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
