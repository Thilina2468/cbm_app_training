import 'package:equatable/equatable.dart';

class AboutYouState extends Equatable {
  final bool done;

  const AboutYouState({this.done = false});

  @override
  List<Object?> get props => [done];
}
