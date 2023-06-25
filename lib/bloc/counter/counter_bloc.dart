import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    // on<IncrementCountEvent>(
    //   _incrementCountEvent,
    //   transformer: restartable(),
    // );
    // on<DecrementCountEvent>(
    //   _decrementCountEvent,
    //   transformer: droppable(),
    // );

    // If the two runs sequentially

    on<CounterEvent>(
      (event, emit) async {
        if (event is IncrementCountEvent) {
          await _incrementCountEvent(event, emit);
        } else if (event is DecrementCountEvent) {
          await _decrementCountEvent(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  Future<void> _incrementCountEvent(
      IncrementCountEvent event, Emitter<CounterState> emit) async {
    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(counter: state.counter + 1));
  }

  Future<void> _decrementCountEvent(
      DecrementCountEvent event, Emitter<CounterState> emit) async {
    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(counter: state.counter - 1));
  }
}
