import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void incrementCounter() {
    emit(state + 1);
    print("cubit count");
  }

  void decrementCounter() {
    if (state == 0) {
      addError('Counter should above 0');
    }
    emit(state - 1);
    print("cubit count");
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
