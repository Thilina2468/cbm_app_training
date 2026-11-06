import 'package:kyc_practice_app/features/onboarding/bloc/pages/billing/billing_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/billing/billing_event.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:kyc_practice_app/core/widgets/checklist.dart';
import 'package:kyc_practice_app/core/widgets/app_back_bar.dart';
import 'package:kyc_practice_app/core/widgets/illustration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kyc_practice_app/core/utils/app_logger.dart';
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
      appBar: const AppBackBar(),
      body: Stack(
        children: [
          BackgroundTemplate(
            title: 'Let’s take a photo of your bill',
            subtitle:
                'We can only accept a photo of your bill. That means, no scans or photocopies.',
            footer: Button(
              text: 'Next',
              onPressed: () async {
                final XFile? photo =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (photo == null || !context.mounted) return;
                appLog.i('Billing proof photo taken: ${photo.path}');
                context.read<BillingBloc>().add(BillingSubmitted());
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Column(
              children: [
                Illustration('assets/images/billing_proof.png'),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checklist(
                      text: 'Make sure you are in a well-lit room',
                    ),
                    Checklist(
                      text: 'Put your bill on a plain dark surface',
                    ),
                    Checklist(
                      text: 'Check there’s no glare on your bill',
                    ),
                    Checklist(
                      text: 'Check we can see your bill clearly',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
