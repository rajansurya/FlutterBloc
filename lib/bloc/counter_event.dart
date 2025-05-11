part of 'counter_bloc.dart';

sealed class StateCounter{}
class CounterIncrement  extends StateCounter{}
class CounterDecrement extends StateCounter{

}