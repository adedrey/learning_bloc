part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  CounterState({
    required this.counter,
  });

  factory CounterState.initial() => CounterState(counter: 0);

  @override
  String toString() => 'CounterState(counter: $counter)';

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object> get props => [counter];
}
