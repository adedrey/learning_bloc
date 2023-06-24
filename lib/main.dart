import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/theme/theme_bloc.dart';
import 'package:learn_bloc/bloc/theme/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const MyHomePage(),
          );
        },
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
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          final randInt = Random().nextInt(10);
          print('$randInt');
          context.read<ThemeBloc>().add(
                ChangeThemeEvent(randInt: randInt),
              );
        },
        child: Text('Change Theme'),
      )),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {},
      //       child: Icon(Icons.add),
      //       heroTag: 'increment',
      //     ),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {},
      //       child: Icon(Icons.remove),
      //       heroTag: 'decrement',
      //     ),
      //   ],
      // ),
    );
  }
}
