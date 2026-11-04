import 'package:kyc_practice_app/bloc/onboarding/pages/about_you/about_you_bloc.dart';
import 'package:kyc_practice_app/bloc/onboarding/pages/about_you/about_you_event.dart';
import 'package:kyc_practice_app/widgets/background_template.dart';
import 'package:kyc_practice_app/widgets/button.dart';
import 'package:kyc_practice_app/widgets/date.dart';
import 'package:kyc_practice_app/widgets/input_field.dart';
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
            title: 'Tell us a little about you',
            subtitle:
                'Enter your first, last, and other names exactly as they appear in your national ID.',
            child: Form(
              child: Column(
                children: [
                  InputField(hintText: 'National ID Number'),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  InputField(hintText: 'First name'),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  InputField(hintText: 'Last name'),
                  Padding(
                    padding: EdgeInsets.all(18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'optional',
                        style: TextStyle(
                          color: Color.fromARGB(255, 111, 110, 110),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(3),
                  ),
                  InputField(hintText: 'Other names'),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Date(hintText: 'Date of birth (DD/MM/YYYY)'),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Button(
                    text: 'Next',
                    onPressed: () {
                      context.read<AboutYouBloc>().add(AboutYouSubmitted());
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
