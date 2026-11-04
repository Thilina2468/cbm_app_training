import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final bool aboutYouDone;
  final bool identityVerificationDone;

  const OnboardingState({
    this.aboutYouDone = false,
    this.identityVerificationDone = false,
  });

  @override
  List<Object?> get props => [aboutYouDone, identityVerificationDone];
}
