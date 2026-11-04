import 'package:kyc_practice_app/bloc/onboarding/pages/work_permit/work_permit_bloc.dart';
import 'package:kyc_practice_app/bloc/onboarding/pages/work_permit/work_permit_event.dart';
import 'package:kyc_practice_app/widgets/background_template.dart';
import 'package:kyc_practice_app/widgets/button.dart';
import 'package:kyc_practice_app/widgets/checklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherDocument extends StatefulWidget {
  const OtherDocument({super.key});

  @override
  State<OtherDocument> createState() => _OtherDocumentState();
}

class _OtherDocumentState extends State<OtherDocument> {
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
            title: 'Let’s Take a Photo of Your Work permit',
            subtitle:
                'We can only accept a photo of your work permit. That means, no scans or photocopies.',
            child: Column(
              children: [
                Image.asset(
                  'assets/images/work_permit.png',
                  height: 180,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Button(
                    text: 'Next',
                    onPressed: () {
                      context.read<WorkPermitBloc>().add(WorkPermitSubmitted());
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
