import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/bloc/auth_bloc.dart';
import 'package:state_bloc/cubit/counter_cubit.dart';

import '../bloc/counter_bloc.dart';

class IncreDecre extends StatelessWidget{
  const IncreDecre({super.key});



  @override
  Widget build(BuildContext context) {
    // final counterState=BlocProvider.of<CounterCubit>(context);
    final counterBloc=context.watch<CounterBloc>().state; /*as AuthStateSuccess;*/
    if(counterBloc is AuthStateInitial){
// Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (ctx)=>IncreDecre()));
    }else if(counterBloc is AuthStateFailure){

    }else if(counterBloc is AuthStateSuccess){

    }
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children:[ FloatingActionButton(
            heroTag: '${counterBloc.isEven}',
            onPressed: () {
              // counterState.increament();
              context.read<CounterBloc>().add(CounterIncrement());
              // context.read<CounterBloc>().increament();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
            FloatingActionButton(
              heroTag: 'minus',
              onPressed: () {
                context.read<CounterBloc>().add(CounterDecrement());
                // counterState.decreament();
                // context.read<CounterBloc>().decreament();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.remove),
            ),
          ]
      ),

    );
  }

}