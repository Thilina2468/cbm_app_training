import 'package:kyc_practice_app/screens/national_id_clarification.dart';
import 'package:kyc_practice_app/widgets/background_template.dart';
import 'package:kyc_practice_app/widgets/button.dart';
import 'package:kyc_practice_app/widgets/checklist.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(children: [
        BackgroundTemplate(
            cardHeight: 700,
            title: 'Let’s take a selfie',
            subtitle: 'Your selfie will let us know it’s really you.',
            child: Column(
              children: [
                Image.asset(
                  'assets/images/selfie_guide.png',
                  height: 250,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
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
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Button(
                    text: 'I’m ready',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NationalIdClarification(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
