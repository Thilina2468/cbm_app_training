import 'package:equatable/equatable.dart';

class BillingState extends Equatable {
  final bool done;

  const BillingState({this.done = false});

  @override
  List<Object?> get props => [done];
}
