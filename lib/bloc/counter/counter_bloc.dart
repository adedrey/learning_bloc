import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> with HydratedMixin {
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
    emit(state.copyWith(counter: state.counter + 1));
  }

  Future<void> _decrementCountEvent(
      DecrementCountEvent event, Emitter<CounterState> emit) async {
    emit(state.copyWith(counter: state.counter - 1));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    print('Counter from storage: $json');
    final counterState = CounterState.fromJson(json);
    print("CounterState: $counterState");
    return counterState;
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    print('Counter to storage: $state');
    final counterJson = state.toJson();
    print("CounterJson: $counterJson");
    return counterJson;
  }
}
