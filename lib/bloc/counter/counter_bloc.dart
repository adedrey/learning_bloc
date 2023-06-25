import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:learn_bloc/bloc/color/color_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int incrementSize = 1;
  final ColorBloc colorBloc;
  late final StreamSubscription streamSubscription;
  CounterBloc({required this.colorBloc}) : super(CounterState.initial()) {
    streamSubscription = colorBloc.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 5;
      } else if (colorState.color == Colors.purple) {
        incrementSize = 10;
      } else if (colorState.color == Colors.yellow) {
        incrementSize = 15;
      } else if (colorState.color == Colors.blue) {
        incrementSize = -20;
        add(ChangeCountEvent());
      }
    });

    on<ChangeCountEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + incrementSize));
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    streamSubscription.cancel();
    return super.close();
  }
}
