import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementCountEvent>((event, emit) {
      emit(
        state.copyWith(counter: state.counter + 1),
      );
    });

    // If LOGIC is very deep
    on<DecrementCountEvent>(_decrementCounter);
  }
// If LOGIC is very deep
  void _decrementCounter(
    DecrementCountEvent event,
    Emitter<CounterState> emit,
  ) {
    emit(
      state.copyWith(counter: state.counter - 1),
    );
  }
}
