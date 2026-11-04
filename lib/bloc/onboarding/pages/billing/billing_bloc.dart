import 'package:flutter_bloc/flutter_bloc.dart';
import 'billing_event.dart';
import 'billing_state.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  BillingBloc() : super(const BillingState()) {
    on<BillingSubmitted>((event, emit) {
      emit(const BillingState(done: true));
    });
  }
}
