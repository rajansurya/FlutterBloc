import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:state_bloc/bloc/PostBloc.dart';
import 'package:state_bloc/bloc/app_bloc_observer.dart';
import 'package:state_bloc/bloc/counter_bloc.dart';
import 'package:state_bloc/cubit/counter_cubit.dart';
import 'package:state_bloc/home_screen.dart';

import 'bloc/PostEvent.dart';
import 'get_it/get_it.dart';

void main() {
  configureDependencies();
  setupDependencies();
  Bloc.observer=AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final postBloc= GetIt.I<PostBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (ctx) => CounterBloc()),
        BlocProvider(create: (ctx)=>postBloc)
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
