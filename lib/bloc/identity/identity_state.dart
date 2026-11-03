import 'package:equatable/equatable.dart';

class IdentityState extends Equatable {
  final bool aboutYouDone;

  const IdentityState({
    this.aboutYouDone = false,
  });

  @override
  List<Object?> get props => [aboutYouDone];
}
