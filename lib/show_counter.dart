import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter/counter_cubit.dart';

class ShowCounter extends StatelessWidget {
  const ShowCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Page"),
      ),
      body: Center(
        child: Text(
          "${context.watch<CounterCubit>().state.counter}",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
