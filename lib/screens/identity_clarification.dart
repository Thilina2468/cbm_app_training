import 'package:cbm_app_training/screens/success_screen.dart';
import 'package:cbm_app_training/widgets/background_template.dart';
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
      body: BackgroundTemplate(
        title: 'Identity Clarification',
        subtitle: 'We’ll Keep Your Information Secure and Confidential.',
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
    );
  }
}
