import 'package:flutter_bloc/flutter_bloc.dart';
import 'identity_event.dart';
import 'identity_state.dart';

class IdentityBloc extends Bloc<IdentityEvent, IdentityState> {
  IdentityBloc() : super(const IdentityState()) {
    on<IdentitySubmitted>((event, emit) {
      emit(const IdentityState(done: true));
    });
  }
}
