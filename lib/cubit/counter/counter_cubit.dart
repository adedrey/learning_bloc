import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../color/color_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int incrementSize = 1;
  final ColorCubit colorCubit;
  late final StreamSubscription streamSubscription;
  CounterCubit({required this.colorCubit}) : super(CounterState.initial()) {
    streamSubscription = colorCubit.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 5;
      } else if (colorState.color == Colors.purple) {
        incrementSize = 10;
      } else if (colorState.color == Colors.yellow) {
        incrementSize = 15;
      } else if (colorState.color == Colors.blue) {
        emit(state.copyWith(counter: state.counter - 17));
        incrementSize = -20;
      }
    });
  }

  void changeIncrementSize() {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }

  @override
  Future<void> close() {
    // TODO: implement close
    streamSubscription.cancel();
    return super.close();
  }
}
