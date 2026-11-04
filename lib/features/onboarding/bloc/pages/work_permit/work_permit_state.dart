import 'package:equatable/equatable.dart';

class WorkPermitState extends Equatable {
  final bool done;

  const WorkPermitState({this.done = false});

  @override
  List<Object?> get props => [done];
}
