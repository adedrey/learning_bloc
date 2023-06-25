import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/counter/counter_cubit.dart';
import 'package:learn_bloc/show_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _countCubit = CounterCubit();
  // This widget is the root of your application.

  @override
  void dispose() {
    // TODO: implement dispose
    _countCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: _countCubit,
                child: MyHomePage(),
              ),
            );
          case "/counter":
            return MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: _countCubit,
                child: ShowCounter(),
              ),
            );
          default:
            return null;
        }
      },
      // home: BlocProvider<CounterCubit>(
      //   create: (context) => CounterCubit(),
      //   child: const MyHomePage(),
      // ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/counter");
              },
              child: Text(
                "Show Counter",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().increment(),
              child: Text(
                "Increment Counter",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
