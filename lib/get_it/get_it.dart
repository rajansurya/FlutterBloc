

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:state_bloc/get_it/get_it.config.dart';

import '../bloc/PostBloc.dart';
import '../repo/PostRepository.dart';

final getItInstance=GetIt.instance;

@InjectableInit()
void configureDependencies()=>getItInstance.init();

void setupDependencies() {
  // Step 1: Register the repository
  getItInstance.registerLazySingleton<PostRepository>(() => PostRepository());
  // getItInstance.registerSingleton<PostRepository>(PostRepository());
  // Step 2: Register the bloc with dependency injection
  getItInstance.registerLazySingleton<PostBloc>(() => PostBloc(getItInstance<PostRepository>()));

  // getItInt.registerLazySingleton(()=>PostRepository());
}