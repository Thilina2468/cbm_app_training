import 'package:kyc_practice_app/features/onboarding/bloc/pages/identity/identity_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/identity/identity_event.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:kyc_practice_app/core/widgets/checklist.dart';
import 'package:kyc_practice_app/core/widgets/app_back_bar.dart';
import 'package:kyc_practice_app/core/widgets/illustration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NationalIdClarification extends StatelessWidget {
  const NationalIdClarification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBackBar(),
      body: Stack(
        children: [
          BackgroundTemplate(
            title: 'Let’s take a photo of your National ID',
            subtitle:
                'We can only accept a photo of your original ID. That means, no scans or photocopies.',
            footer: Button(
              text: 'I’m ready',
              onPressed: () {
                context.read<IdentityBloc>().add(IdentitySubmitted());
                Navigator.pop(context);
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Column(
              children: [
                Illustration('assets/images/id_card.png'),
                const Padding(
                  padding: EdgeInsets.only(top: AppSpace.s32),
                  child: Padding(
                    padding: EdgeInsets.only(top: AppSpace.s16),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
