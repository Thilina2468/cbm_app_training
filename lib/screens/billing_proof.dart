import 'package:cbm_app_training/bloc/onboarding/pages/billing/billing_bloc.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/billing/billing_event.dart';
import 'package:cbm_app_training/widgets/background_template.dart';
import 'package:cbm_app_training/widgets/button.dart';
import 'package:cbm_app_training/widgets/checklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillingProof extends StatefulWidget {
  const BillingProof({super.key});

  @override
  State<BillingProof> createState() => _BillingProofState();
}

class _BillingProofState extends State<BillingProof> {
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
          BackgroundTemplate(
            cardHeight: 630,
            title: 'Let’s Take a Photo of Your Billing Proof',
            subtitle:
                'We can only accept a photo of your billing proof. That means, no scans or photocopies.',
            child: Column(
              children: [
                Image.asset(
                  'assets/images/billing_proof.png',
                  height: 200,
                  width: 300,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checklist(
                      text: 'Make sure you are in a well-lit room',
                    ),
                    Checklist(
                      text: 'Put your signature on a plain dark surface',
                    ),
                    Checklist(
                      text: 'Check there’s no glare on your signature',
                    ),
                    Checklist(
                      text: 'Check we can see your signature clearly',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Button(
                    text: 'Next',
                    onPressed: () {
                      context.read<BillingBloc>().add(BillingSubmitted());
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(14),
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
