import 'package:cbm_app_training/screens/success_screen.dart';
import 'package:cbm_app_training/widgets/button.dart';
import 'package:cbm_app_training/widgets/verification_steps.dart';
import 'package:flutter/material.dart';

class IdentityClarification extends StatelessWidget {
  const IdentityClarification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
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
              height: 650,
              padding: const EdgeInsets.all(40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(children: [
                const VerificationTile(
                  heading: 'About you',
                  description: 'Your citizenship and personal details.',
                  icon: Icons.person_outline_rounded,
                ),
                const VerificationTile(
                  heading: 'Your identity',
                  description: 'Checking to make sure you and your ID match.',
                  icon: Icons.badge_outlined,
                ),
                const VerificationTile(
                  heading: 'Other Documents',
                  description:
                      'Processing of transactions and services that require your authorization.',
                  icon: Icons.description_outlined,
                ),
                const VerificationTile(
                  heading: 'Billing Proof',
                  description:
                      'Checking to make sure you are an permanent residence.',
                  icon: Icons.payment_outlined,
                ),
                Button(
                  text: 'Next',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessScreen(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(14),
                ),
              ]),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 100, left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let’s clarify your identity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'We’ll keep your information secure and confidential.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
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
