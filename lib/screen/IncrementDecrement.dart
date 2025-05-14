import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/bloc/posts/PostBloc.dart';
import 'package:state_bloc/bloc/posts/PostState.dart';
import 'package:state_bloc/bloc/auth/auth_bloc.dart';

import '../bloc/counter/counter_bloc.dart';
import '../cubit/CounterCubit.dart';

class IncrementDecrement extends StatefulWidget {
  const IncrementDecrement({super.key});

  @override
  State<IncrementDecrement> createState() {
   return _IncrementDecrementState();
  }
}
class _IncrementDecrementState extends State<IncrementDecrement>{
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPosts());
  }
  @override
  Widget build(BuildContext context) {
    /*Access via BlocProvider*/
    final counterCubitState=BlocProvider.of<CounterCubit>(context);
    final counterBloc = context.watch<CounterBloc>().state;

    /*State handling*/
    if (counterBloc is AuthStateInitial) {
    } else if (counterBloc is AuthStateFailure) {
    } else if (counterBloc is AuthStateSuccess) {}

    return BlocListener<PostBloc, PostState>(
        listener: (BuildContext context, PostState state) {
          if (state is PostLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Loading data...')));
          } else if (state is PostLoaded) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Loading completed...')));
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Post data'),),
          floatingActionButton: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'plus',
                  onPressed: () {
                    /*create instance of CounterBloc and access the function*/
                    counterCubitState.incrementCounter();

                    /*Access Bloc instance through context*/
                    context.read<CounterBloc>().add(CounterIncrement());

                    /*Cubit - Access Bloc instance through context */
                    // context.read<CounterBloc>().incrementCounter();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'minus',
                  onPressed: () {
                    /*create instance of CounterBloc and access the function*/
                    counterCubitState.decrementCounter();

                    /*Access Bloc instance through context*/
                    context.read<CounterBloc>().add(CounterDecrement());

                    /*Cubit - Access Bloc instance through context */
                    // context.read<CounterBloc>().decrementCounter();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ]),
          body: Center(
            child: BlocBuilder<PostBloc, PostState>(builder: (ctx, state) {
              if (state is PostLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PostLoaded) {
                final data = state.posts;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        margin:const  EdgeInsets.only(top: 5,bottom: 5,left: 7,right: 7),
                        child: ListTile(
                          leading: const Icon(Icons.access_time_rounded),
                          title: Text(data[index].title),
                          subtitle: Text(data[index].body),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                        ),
                      );
                    });
              }else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ));
  }


}
