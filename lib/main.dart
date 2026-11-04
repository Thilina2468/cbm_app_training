import 'package:kyc_practice_app/features/onboarding/bloc/pages/about_you/about_you_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/billing/billing_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/identity/identity_bloc.dart';
import 'package:kyc_practice_app/features/onboarding/bloc/pages/work_permit/work_permit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/screens/login_screen.dart';
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
