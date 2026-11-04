import 'package:cbm_app_training/bloc/onboarding/pages/about_you/about_you_bloc.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/about_you/about_you_event.dart';
import 'package:cbm_app_training/widgets/background_template.dart';
import 'package:cbm_app_training/widgets/button.dart';
import 'package:cbm_app_training/widgets/date.dart';
import 'package:cbm_app_training/widgets/input_field.dart';
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
                'Enter your first, last, and other names exactly as they appear in your national ID. ',
            child: Form(
              child: Column(
                children: [
                  InputField(hintText: 'National ID'),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  InputField(hintText: 'First Name'),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  InputField(hintText: 'Last Name'),
                  Padding(
                    padding: EdgeInsets.all(18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Optional',
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
                  InputField(hintText: 'Other Names'),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Date(hintText: 'Date of Birth'),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Button(
                    text: 'Continue',
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
