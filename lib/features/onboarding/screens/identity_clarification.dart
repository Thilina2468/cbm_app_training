import 'package:kyc_practice_app/features/onboarding/screens/national_id_clarification.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:kyc_practice_app/core/widgets/checklist.dart';
import 'package:kyc_practice_app/core/widgets/app_back_bar.dart';
import 'package:kyc_practice_app/core/widgets/illustration.dart';
import 'package:flutter/material.dart';

class IdentityClarification extends StatefulWidget {
  const IdentityClarification({super.key});

  @override
  State<IdentityClarification> createState() => _IdentityClarificationState();
}

class _IdentityClarificationState extends State<IdentityClarification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBackBar(),
      body: Stack(children: [
        BackgroundTemplate(
            title: 'Let’s take a selfie',
            subtitle: 'Your selfie will let us know it’s really you.',
            footer: Button(
              text: 'I’m ready',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NationalIdClarification(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Column(
              children: [
                Illustration('assets/images/selfie_guide.png'),
                const Padding(
                  padding: EdgeInsets.only(top: AppSpace.s32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checklist(
                        text: 'Make sure you are in a well-lit room',
                      ),
                      Checklist(
                        text: 'Make sure we can see you clearly',
                      ),
                      Checklist(
                        text:
                            'Remove anything that hides your face (glasses are fine)',
                      ),
                      Checklist(
                        text: 'Look straight at the camera and smile',
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
