import 'package:cbm_app_training/bloc/onboarding/pages/about_you/about_you_bloc.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/about_you/about_you_state.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/billing/billing_bloc.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/billing/billing_state.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/identity/identity_bloc.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/identity/identity_state.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/work_permit/work_permit_bloc.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/work_permit/work_permit_state.dart';
import 'package:cbm_app_training/screens/about_you.dart';
import 'package:cbm_app_training/screens/billing_proof.dart';
import 'package:cbm_app_training/screens/identity_clarification.dart';
import 'package:cbm_app_training/screens/other_document.dart';
import 'package:cbm_app_training/screens/success_screen.dart';
import 'package:cbm_app_training/widgets/background_template.dart';
import 'package:cbm_app_training/widgets/button.dart';
import 'package:cbm_app_training/widgets/verification_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingSteps extends StatelessWidget {
  const OnboardingSteps({super.key});

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
        title: 'Let’s Clarify Your Identity',
        subtitle: 'We’ll Keep Your Information Secure and Confidential.',
        child: Column(
          children: [
            BlocBuilder<AboutYouBloc, AboutYouState>(
              builder: (context, state) {
                return VerificationTile(
                  heading: 'About you',
                  description: 'Your citizenship and personal details.',
                  icon: Icons.person_outline_rounded,
                  isComplete: state.done,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutYou(),
                      ),
                    );
                  },
                );
              },
            ),
            BlocBuilder<IdentityBloc, IdentityState>(
              builder: (context, state) {
                return VerificationTile(
                  heading: 'Your identity',
                  description: 'Checking to make sure you and your ID match.',
                  icon: Icons.badge_outlined,
                  isComplete: state.done,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IdentityClarification(),
                      ),
                    );
                  },
                );
              },
            ),
            BlocBuilder<WorkPermitBloc, WorkPermitState>(
                builder: (context, state) {
              return VerificationTile(
                heading: 'Other Documents',
                description:
                    'Processing of transactions and services that require your authorization.',
                icon: Icons.description_outlined,
                isComplete: state.done,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtherDocument(),
                    ),
                  );
                },
              );
            }),
            BlocBuilder<BillingBloc, BillingState>(builder: (context, state) {
              return VerificationTile(
                heading: 'Billing Proof',
                description: 'Verifying your permanent residency status.',
                icon: Icons.payment_outlined,
                isComplete: state.done,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BillingProof(),
                    ),
                  );
                },
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Button(
                isDisabled: context.watch<AboutYouBloc>().state.done &&
                        context.watch<IdentityBloc>().state.done &&
                        context.watch<WorkPermitBloc>().state.done &&
                        context.watch<BillingBloc>().state.done
                    ? false
                    : true,
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
            ),
          ],
        ),
      ),
    );
  }
}
