import 'package:flutter_bloc/flutter_bloc.dart';
import 'work_permit_event.dart';
import 'work_permit_state.dart';

class WorkPermitBloc extends Bloc<WorkPermitEvent, WorkPermitState> {
  WorkPermitBloc() : super(const WorkPermitState()) {
    on<WorkPermitSubmitted>((event, emit) {
      emit(const WorkPermitState(done: true));
    });
  }
}
