import 'package:flutter_bloc/flutter_bloc.dart';
import 'about_you_event.dart';
import 'about_you_state.dart';

class AboutYouBloc extends Bloc<AboutYouEvent, AboutYouState> {
  AboutYouBloc() : super(const AboutYouState()) {
    on<AboutYouSubmitted>((event, emit) {
      emit(const AboutYouState(done: true));
    });
  }
}
