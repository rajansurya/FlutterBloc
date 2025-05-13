import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/bloc/PostBloc.dart';
import 'package:state_bloc/bloc/PostState.dart';
import 'package:state_bloc/bloc/auth_bloc.dart';

import '../bloc/counter_bloc.dart';

class IncreDecre extends StatefulWidget {
  const IncreDecre({super.key});

  @override
  State<IncreDecre> createState() {
   return _IncreDecreState();
  }
}
class _IncreDecreState extends State<IncreDecre>{
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPosts());
  }
  @override
  Widget build(BuildContext context) {
    // final counterState=BlocProvider.of<CounterCubit>(context);
    final counterBloc =
        context.watch<CounterBloc>().state;
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
