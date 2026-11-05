import 'package:kyc_practice_app/features/onboarding/bloc/pages/about_you/about_you_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/billing/billing_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/identity/identity_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/work_permit/work_permit_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/screens/about_you.dart';
import 'package:kyc_practice_app/features/onboarding/screens/billing_proof.dart';
import 'package:kyc_practice_app/features/onboarding/screens/identity_clarification.dart';
import 'package:kyc_practice_app/features/onboarding/screens/other_document.dart';
import 'package:kyc_practice_app/features/success/screens/success_screen.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:kyc_practice_app/core/widgets/verification_steps.dart';
import 'package:kyc_practice_app/core/widgets/app_back_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingSteps extends StatelessWidget {
  const OnboardingSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final bool aboutDone = context.watch<AboutYouBloc>().state.done;
    final bool identityDone = context.watch<IdentityBloc>().state.done;
    final bool workDone = context.watch<WorkPermitBloc>().state.done;
    final bool billingDone = context.watch<BillingBloc>().state.done;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBackBar(),
      body: BackgroundTemplate(
        title: 'Let’s clarify your identity',
        subtitle: 'We’ll keep your information secure and confidential.',
        child: Column(
          children: [
            VerificationTile(
              heading: 'About you',
              description: 'Your citizenship and personal details.',
              iconAsset: 'assets/images/icon_profile.png',
              isComplete: aboutDone,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutYou(),
                  ),
                );
              },
            ),
            VerificationTile(
              heading: 'Your identity',
              description: 'Checking to make sure you and your ID match.',
              iconAsset: 'assets/images/icon_identity.png',
              isComplete: identityDone,
              isLocked: !aboutDone,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IdentityClarification(),
                  ),
                );
              },
            ),
            VerificationTile(
              heading: 'Other document',
              description:
                  'Processing of transactions and services that require your authorization.',
              iconAsset: 'assets/images/icon_other_document.png',
              isComplete: workDone,
              isLocked: !(aboutDone && identityDone),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtherDocument(),
                  ),
                );
              },
            ),
            VerificationTile(
              heading: 'Billing proof',
              description: 'Verifying your permanent residency status.',
              iconAsset: 'assets/images/icon_bill.png',
              isComplete: billingDone,
              isLocked: !(aboutDone && identityDone && workDone),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BillingProof(),
                  ),
                );
              },
            ),
          ],
        ),
        footer: Button(
          text: 'Next',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SuccessScreen(),
              ),
            );
          },
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        ),
      ),
    );
  }
}
