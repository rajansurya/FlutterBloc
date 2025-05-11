import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<StateCounter, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>((event, emit) {
      emit(state + 1);
    },/*transformer:(s1,s2) {
      return Stream.error(s1);
    }*/);

    on<CounterDecrement>((event,emit){
      emit(state - 1);
    });
  }
}
