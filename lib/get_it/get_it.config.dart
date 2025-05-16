// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:state_bloc/bloc/posts/PostBloc.dart' as _i36;
import 'package:state_bloc/modules/RegisterModule.dart' as _i722;
import 'package:state_bloc/repo/PostRepositoryImpl.dart' as _i338;
import 'package:state_bloc/repo/repointerface/PostRepository.dart' as _i403;
import 'package:state_bloc/repo/repointerface/UserRepository.dart' as _i86;
import 'package:state_bloc/repo/UserRepositoryImpl.dart' as _i948;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i519.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i403.PostRepository>(() => _i338.PostRepositoryImpl());
    gh.lazySingleton<_i86.UserRepository>(() => _i948.UserRepositoryImpl());
    gh.factory<_i36.PostBloc>(() => _i36.PostBloc(gh<_i403.PostRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i722.RegisterModule {}
