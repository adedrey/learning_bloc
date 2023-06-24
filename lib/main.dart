import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubits/counter/counter_cubit.dart';
import 'package:learn_bloc/other_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        // listenWhen: (previous, current) {
        //   if (previous.counter == 5 || previous.counter == -1) {
        //     return false;
        //   }
        //   return true;
        // },
        listener: (context, state) {
          if (state.counter == 5) {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  content: Text("counter is ${state.counter}"),
                );
              },
            );
          } else if (state.counter < 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtherPage(),
              ),
            );
          }
        },
        builder: (context, state) => Center(
          child: Text(
            state.counter.toString(),
            style: TextStyle(fontSize: 52),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterCubit>(context, listen: false)
                    .increment(),
            child: Icon(Icons.add),
            heroTag: 'increment',
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: Icon(Icons.remove),
            heroTag: 'decrement',
          ),
        ],
      ),
    );
  }
}
