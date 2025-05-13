

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:state_bloc/get_it/get_it.config.dart';

import '../bloc/PostBloc.dart';
import '../repo/PostRepository.dart';

final getItInt=GetIt.instance;
@InjectableInit()
void configureDependencies()=>getItInt.init();

void setupDependencies() {
  // Step 1: Register the repository
  // getItInt.registerLazySingleton<PostRepository>(() => PostRepository());
  getItInt.registerSingleton<PostRepository>(PostRepository());
  // Step 2: Register the bloc with dependency injection
  getItInt.registerLazySingleton<PostBloc>(() => PostBloc(getItInt<PostRepository>()));

  // getItInt.registerLazySingleton(()=>PostRepository());
}