import 'package:injectable/injectable.dart';
import 'package:state_bloc/repo/repointerface/UserRepository.dart';

@LazySingleton(as:UserRepository)
class UserRepositoryImpl implements UserRepository{
  @override
  Future<String> fetchUser() {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }

}