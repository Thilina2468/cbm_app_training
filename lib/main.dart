import 'package:cbm_app_training/bloc/onboarding/pages/about_you/about_you_bloc.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/billing/billing_bloc.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/identity/identity_bloc.dart';
import 'package:cbm_app_training/bloc/onboarding/pages/work_permit/work_permit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/onboarding/onboarding_bloc.dart';
import 'screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(
          create: (context) => OnboardingBloc(),
        ),
        BlocProvider<AboutYouBloc>(
          create: (context) => AboutYouBloc(),
        ),
        BlocProvider<IdentityBloc>(
          create: (context) => IdentityBloc(),
        ),
        BlocProvider<WorkPermitBloc>(
          create: (context) => WorkPermitBloc(),
        ),
        BlocProvider<BillingBloc>(
          create: (context) => BillingBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}
