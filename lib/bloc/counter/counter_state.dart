part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  CounterState({
    required this.counter,
  });

  factory CounterState.initial() {
    return CounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  String toString() => 'Counter: $counter';

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'counter': counter,
    };
  }

  factory CounterState.fromJson(Map<String, dynamic> json) {
    return CounterState(
      counter: json['counter'] as int,
    );
  }
}
