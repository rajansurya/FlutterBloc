import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/bloc/PostBloc.dart';
import 'package:state_bloc/bloc/PostState.dart';
import 'package:state_bloc/bloc/auth_bloc.dart';

import '../bloc/counter_bloc.dart';

class IncreDecre extends StatelessWidget {
  const IncreDecre({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterState=BlocProvider.of<CounterCubit>(context);
    final counterBloc =
        context.watch<CounterBloc>().state; /*as AuthStateSuccess;*/
    if (counterBloc is AuthStateInitial) {
// Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (ctx)=>IncreDecre()));
    } else if (counterBloc is AuthStateFailure) {
    } else if (counterBloc is AuthStateSuccess) {}
    return BlocListener<PostBloc, PostState>(
        listener: (BuildContext context, PostState state) {
          if (state is PostLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('HIhi')));
          } else if (state is PostLoaded) {}
        },
        child: Scaffold(
          appBar: AppBar(),
          floatingActionButton: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
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
                    context.read<PostBloc>().add(FetchPosts());
                    context.read<CounterBloc>().add(CounterDecrement());
                    // counterState.decreament();
                    // context.read<CounterBloc>().decreament();
                  },
                  tooltip: 'Increment',
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
                      return ListTile(
                        leading: Icon(Icons.access_time_rounded),
                        title: Text(data[index].title),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
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
