import 'package:kyc_practice_app/features/onboarding/bloc/pages/about_you/about_you_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/about_you/about_you_event.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:kyc_practice_app/core/widgets/date.dart';
import 'package:kyc_practice_app/core/widgets/input_field.dart';
import 'package:kyc_practice_app/core/widgets/app_back_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutYou extends StatefulWidget {
  const AboutYou({super.key});

  @override
  State<AboutYou> createState() => _AboutYouState();
}

class _AboutYouState extends State<AboutYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBackBar(),
      body: Stack(
        children: [
          BackgroundTemplate(
            title: 'Tell us a little about you',
            subtitle:
                'Enter your first, last, and other names exactly as they appear in your national ID.',
            footer: Button(
              text: 'Next',
              onPressed: () {
                context.read<AboutYouBloc>().add(AboutYouSubmitted());
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Form(
              child: Column(
                children: [
                  const InputField(hintText: 'National ID Number'),
                  AppSpace.h20,
                  const InputField(hintText: 'First name'),
                  AppSpace.h20,
                  const InputField(hintText: 'Last name'),
                  AppSpace.h24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('optional', style: AppStyles.body(context)),
                    ],
                  ),
                  AppSpace.h8,
                  const InputField(hintText: 'Other names'),
                  AppSpace.h20,
                  const Date(hintText: 'Date of birth (DD/MM/YYYY)'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
