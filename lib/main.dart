import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/color/color_cubit.dart';
import 'package:learn_bloc/cubit/counter/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(
          create: (context) => ColorCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementSize = 1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementSize = 1;
        } else if (state.color == Colors.green) {
          incrementSize = 5;
        } else if (state.color == Colors.purple) {
          incrementSize = 10;
        } else if (state.color == Colors.yellow) {
          incrementSize = 15;
        } else if (state.color == Colors.blue) {
          context.read<CounterCubit>().changeIncrementSize(incrementSize: -17);
          incrementSize = -20;
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorCubit>().state.color,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      context.read<ColorCubit>().changeColorEvent(),
                  child: const Text(
                    'Change Color',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${context.watch<CounterCubit>().state.counter}',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => context
                      .read<CounterCubit>()
                      .changeIncrementSize(incrementSize: incrementSize),
                  child: const Text(
                    'Increment Counter',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
