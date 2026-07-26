// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:financial_transfer_app/features/users/data/datasources/local/user_local_data_source.dart'
    as _i589;
import 'package:financial_transfer_app/features/users/data/datasources/local/user_local_data_source_impl.dart'
    as _i944;
import 'package:financial_transfer_app/features/users/data/repositories/user_repository_impl.dart'
    as _i230;
import 'package:financial_transfer_app/features/users/domain/repositories/user_repository.dart'
    as _i933;
import 'package:financial_transfer_app/injection/register_module.dart' as _i312;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:uuid/uuid.dart' as _i706;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i706.Uuid>(() => registerModule.uuid);
    gh.lazySingleton<_i589.UserLocalDataSource>(
      () => _i944.UserLocalDataSourceImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i706.Uuid>(),
      ),
    );
    gh.lazySingleton<_i933.UserRepository>(
      () => _i230.UserRepositoryImpl(gh<_i589.UserLocalDataSource>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i312.RegisterModule {}
