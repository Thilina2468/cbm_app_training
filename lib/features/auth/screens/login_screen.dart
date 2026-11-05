import 'package:kyc_practice_app/features/onboarding/screens/onboarding_steps.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';
import 'package:kyc_practice_app/core/widgets/background_template.dart';
import 'package:kyc_practice_app/core/widgets/button.dart';
import 'package:kyc_practice_app/core/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const double _pillHeight = 36;
  static const double _pillWidth = 116;
  static const double _pillPaddingLeft = 20;
  static const double _footerRowHeight = 42;
  static const double _languageTop = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          BackgroundTemplate(
            title: 'Login',
            subtitle: 'Unlock more with your password.',
            child: Form(
              child: Column(
                children: [
                  const InputField(hintText: 'Username'),
                  AppSpace.h20,
                  const InputField(
                    hintText: 'Password',
                    iconAsset: 'assets/images/eye_off.png',
                  ),
                  AppSpace.h20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppSpace.s12,
                          bottom: AppSpace.s4,
                        ),
                        child: Text(
                          'Forgot password?',
                          style: AppStyles.body(context),
                        ),
                      ),
                    ],
                  ),
                  AppSpace.h20,
                  Button(
                    text: 'Login',
                    onPressed: () {},
                    borderRadius: BorderRadius.circular(AppSizes.radiusXl),
                  ),
                  AppSpace.h20,
                  Button(
                    text: 'Register',
                    isTransparent: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnboardingSteps(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                  ),
                  AppSpace.h32,
                  const Divider(
                    color: AppColors.borderDivider,
                    thickness: AppSizes.borderWidth,
                  ),
                  AppSpace.h24,
                  Text(
                    'Kill Account',
                    style: AppStyles.bodyLarge(context).copyWith(
                      color: AppColors.textMuted.withOpacity(0.5),
                    ),
                  ),
                  AppSpace.h32,
                  SizedBox(
                    height: _footerRowHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Need help?', style: AppStyles.link(context)),
                        AppSpace.w16,
                        Text(
                          'More info',
                          style: AppStyles.link(context)
                              .copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  AppSpace.h48,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpace.s16,
                    ),
                    child: Text(
                      'By using My CBM, you agree to our Terms of use and Privacy Policy',
                      style: AppStyles.body(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: _languageTop,
              right: AppSpace.s32,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: _pillHeight,
                  width: _pillWidth,
                  padding: const EdgeInsets.only(
                    left: _pillPaddingLeft,
                    right: AppSpace.s12,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceCreditCard,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSizes.radiusFull),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Text('English', style: AppStyles.body(context)),
                        AppSpace.w8,
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.textSecondary,
                          size: AppSizes.iconSm,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
