import 'package:kyc_practice_app/bloc/onboarding/pages/identity/identity_bloc.dart';
import 'package:kyc_practice_app/bloc/onboarding/pages/identity/identity_event.dart';
import 'package:kyc_practice_app/widgets/background_template.dart';
import 'package:kyc_practice_app/widgets/button.dart';
import 'package:kyc_practice_app/widgets/checklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NationalIdClarification extends StatelessWidget {
  const NationalIdClarification({super.key});

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
            title: 'Let’s take a photo of your National ID',
            subtitle:
                'We can only accept a photo of your original ID. That means, no scans or photocopies.',
            child: Column(
              children: [
                Image.asset(
                  'assets/images/id_card.png',
                  height: 220,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checklist(
                              text: 'Make sure you are in a well-lit room',
                            ),
                            Checklist(
                              text: 'Put your ID on a plain dark surface',
                            ),
                            Checklist(
                              text: 'Check there’s no glare on your ID',
                            ),
                            Checklist(
                              text:
                                  'Check we can see all the details of your ID clearly',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Button(
                    text: 'I’m ready',
                    onPressed: () {
                      context.read<IdentityBloc>().add(IdentitySubmitted());
                      Navigator.pop(context);
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
