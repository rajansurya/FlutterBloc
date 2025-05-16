import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {

    on<CounterIncrement>(
      (event, emit) {
        emit(state + 1);
        print("count bloc");
      }, /*transformer:(s1,s2) {
      return Stream.error(s1);
    }*/
    );

    on<CounterDecrement>((event, emit) {
      emit(state - 1);
      print("counter bloc");
    });
  }
}
