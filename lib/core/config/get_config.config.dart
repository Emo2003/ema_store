// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:ema_store/core/services/network_service.dart' as _i521;
import 'package:ema_store/features/auth/data/data_sources/auth_data_source.dart'
    as _i818;
import 'package:ema_store/features/auth/data/data_sources/auth_data_source_imp.dart'
    as _i965;
import 'package:ema_store/features/auth/data/repositories/auth_repo.dart'
    as _i706;
import 'package:ema_store/features/auth/data/repositories/auth_repo_imp.dart'
    as _i207;
import 'package:ema_store/features/auth/presentation/manager/auth_cubit.dart'
    as _i112;
import 'package:ema_store/features/home/data/data_sources/home_data_source.dart'
    as _i568;
import 'package:ema_store/features/home/data/data_sources/home_data_source_imp.dart'
    as _i111;
import 'package:ema_store/features/home/data/repositories/home_repo.dart'
    as _i959;
import 'package:ema_store/features/home/data/repositories/home_repo_imp.dart'
    as _i385;
import 'package:ema_store/features/home/presentation/manager/home_cubit.dart'
    as _i574;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i521.NetworkService>(() => _i521.NetworkService());
    gh.factory<_i568.HomeDataSource>(
      () => _i111.HomeDataSourceImp(gh<_i521.NetworkService>()),
    );
    gh.factory<_i818.AuthDataSource>(
      () => _i965.AuthDataSourceImp(gh<_i521.NetworkService>()),
    );
    gh.factory<_i706.AuthRepo>(
      () => _i207.AuthRepoImp(gh<_i818.AuthDataSource>()),
    );
    gh.factory<_i959.HomeRepo>(
      () => _i385.HomeRepoImp(gh<_i568.HomeDataSource>()),
    );
    gh.factory<_i112.AuthCubit>(() => _i112.AuthCubit(gh<_i706.AuthRepo>()));
    gh.factory<_i574.HomeCubit>(() => _i574.HomeCubit(gh<_i959.HomeRepo>()));
    return this;
  }
}
