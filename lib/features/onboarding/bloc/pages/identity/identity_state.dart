import 'package:equatable/equatable.dart';

class IdentityState extends Equatable {
  final bool done;

  const IdentityState({this.done = false});

  @override
  List<Object?> get props => [done];
}
