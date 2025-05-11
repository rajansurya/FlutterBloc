import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit() : super(0);

  void increament(){
    emit(state+1);
  }
  void decreament(){
    if(state==0){
      addError('Counter should above 0');
    }
    emit(state-1);
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    print(stackTrace);
    super.onError(error, stackTrace);
  }
}