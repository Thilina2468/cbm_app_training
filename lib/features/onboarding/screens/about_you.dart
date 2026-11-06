import 'package:flutter/services.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/about_you/about_you_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/about_you/about_you_event.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';
import 'package:kyc_practice_app/core/utils/validators.dart';
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
  final _formKey = GlobalKey<FormState>();

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
                if (_formKey.currentState!.validate()) {
                  context.read<AboutYouBloc>().add(AboutYouSubmitted());
                  Navigator.pop(context);
                }
              },
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InputField(
                    hintText: 'National ID Number',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[vV0-9]'))
                    ],
                    validator: (value) => Validators.required(
                        value, 'National ID number is required'),
                  ),
                  AppSpace.h20,
                  InputField(
                    hintText: 'First name',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                    ],
                    validator: (value) =>
                        Validators.required(value, 'First name is required'),
                  ),
                  AppSpace.h20,
                  InputField(
                    hintText: 'Last name',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                    ],
                    validator: (value) =>
                        Validators.required(value, 'Last name is required'),
                  ),
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
                  Date(
                      hintText: 'Date of birth (DD/MM/YYYY)',
                      validator: (value) =>
                          Validators.age(value, 'Date of birth is required')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
