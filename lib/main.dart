import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:state_bloc/bloc/posts/PostBloc.dart';
import 'package:state_bloc/bloc/app_bloc_observer.dart';
import 'package:state_bloc/bloc/counter/counter_bloc.dart';
import 'package:state_bloc/cubit/CounterCubit.dart';
import 'package:state_bloc/screen/HomeScreen.dart';

import 'get_it/get_it.dart';

void main() {
  configureDependencies();
  setupDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getItInstance<CounterCubit>()),
        BlocProvider(create: (ctx) => getItInstance<CounterBloc>()),
        BlocProvider(create: (ctx) => getItInstance<PostBloc>()/*GetIt.I<PostBloc>()*/)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
