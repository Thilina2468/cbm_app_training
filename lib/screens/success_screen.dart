import 'package:cbm_app_training/screens/login_screen.dart';
import 'package:cbm_app_training/widgets/background_template.dart';
import 'package:cbm_app_training/widgets/button.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          BackgroundTemplate(
            cardHeight: 150,
            child: Button(
              text: "Let's Go",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          Container(
            width: double.infinity,
            height: 650,
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/confetti.png',
                  width: 120,
                ),
                const SizedBox(height: 40),
                const Text(
                  'Yay, You’ve Joined My CBM!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'You can explore My CBM with limited features while we review, your information. Full access will be granted upon verification.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
