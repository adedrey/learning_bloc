import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:learn_bloc/bloc/counter/counter_bloc.dart';
import 'package:learn_bloc/bloc/theme/theme_bloc.dart';
import 'package:learn_bloc/other_page.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
              ? ThemeData.light()
              : ThemeData.dark(),
          home: const MyHomePage(),
        );
      }),
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
      body: BlocConsumer<CounterBloc, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Text(
              '${context.watch<CounterBloc>().state.counter}',
              style: TextStyle(fontSize: 52),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<ThemeBloc>().add(ChangeThemeEvent()),
            child: Icon(Icons.settings),
            heroTag: 'settings',
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(IncrementCountEvent()),
            child: Icon(Icons.add),
            heroTag: 'increment',
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc>(context)
                .add(DecrementCountEvent()),
            child: Icon(Icons.remove),
            heroTag: 'decrement',
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              HydratedBloc.storage.clear();
            },
            child: Icon(Icons.delete),
            heroTag: 'delete',
          ),
        ],
      ),
    );
  }
}
