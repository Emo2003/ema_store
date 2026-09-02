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
import 'package:ema_store/features/cart/data/data_sources/cart_data_source.dart'
    as _i152;
import 'package:ema_store/features/cart/data/data_sources/cart_data_source_imp.dart'
    as _i516;
import 'package:ema_store/features/cart/data/repositories/cart_repo.dart'
    as _i615;
import 'package:ema_store/features/cart/data/repositories/cart_repo_imp.dart'
    as _i486;
import 'package:ema_store/features/cart/presentation/manager/cart_cubit.dart'
    as _i223;
import 'package:ema_store/features/category/data/data_sources/category_data_source.dart'
    as _i394;
import 'package:ema_store/features/category/data/data_sources/category_data_source_imp.dart'
    as _i405;
import 'package:ema_store/features/category/data/repositories/category_repo.dart'
    as _i640;
import 'package:ema_store/features/category/data/repositories/category_repo_imp.dart'
    as _i35;
import 'package:ema_store/features/category/presentation/manager/category_cubit.dart'
    as _i1048;
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
import 'package:ema_store/features/profile/data/data_sources/profile_data_source.dart'
    as _i492;
import 'package:ema_store/features/profile/data/data_sources/profile_data_source_imp.dart'
    as _i104;
import 'package:ema_store/features/profile/data/repositories/profile_repo.dart'
    as _i377;
import 'package:ema_store/features/profile/data/repositories/profile_repo_imp.dart'
    as _i108;
import 'package:ema_store/features/profile/presentation/manager/profile_cubit.dart'
    as _i184;
import 'package:ema_store/features/wishlist/data/data_sources/wishlist_data_source.dart'
    as _i341;
import 'package:ema_store/features/wishlist/data/data_sources/wishlist_data_source_imp.dart'
    as _i925;
import 'package:ema_store/features/wishlist/data/repositories/wishlist_repo.dart'
    as _i437;
import 'package:ema_store/features/wishlist/data/repositories/wishlist_repo_imp.dart'
    as _i1049;
import 'package:ema_store/features/wishlist/presentation/manager/wishlist_cubit.dart'
    as _i628;
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
    gh.factory<_i492.ProfileDataSource>(
      () => _i104.ProfileDataSourceImp(gh<_i521.NetworkService>()),
    );
    gh.factory<_i394.CategoryDataSource>(
      () => _i405.CategoryDataSourceImp(
        networkService: gh<_i521.NetworkService>(),
      ),
    );
    gh.factory<_i568.HomeDataSource>(
      () => _i111.HomeDataSourceImp(gh<_i521.NetworkService>()),
    );
    gh.factory<_i152.CartDataSource>(
      () => _i516.CartDataSourceImp(gh<_i521.NetworkService>()),
    );
    gh.factory<_i818.AuthDataSource>(
      () => _i965.AuthDataSourceImp(gh<_i521.NetworkService>()),
    );
    gh.factory<_i341.WishlistDataSource>(
      () => _i925.WishlistDataSourceImp(
        networkService: gh<_i521.NetworkService>(),
      ),
    );
    gh.factory<_i640.CategoryRepo>(
      () => _i35.CategoryRepoImp(
        categoryDataSource: gh<_i394.CategoryDataSource>(),
      ),
    );
    gh.factory<_i706.AuthRepo>(
      () => _i207.AuthRepoImp(gh<_i818.AuthDataSource>()),
    );
    gh.lazySingleton<_i1048.CategoryCubit>(
      () => _i1048.CategoryCubit(gh<_i640.CategoryRepo>()),
    );
    gh.factory<_i437.WishlistRepo>(
      () => _i1049.WishlistRepoImp(
        wishlistDataSource: gh<_i341.WishlistDataSource>(),
      ),
    );
    gh.factory<_i959.HomeRepo>(
      () => _i385.HomeRepoImp(gh<_i568.HomeDataSource>()),
    );
    gh.factory<_i112.AuthCubit>(() => _i112.AuthCubit(gh<_i706.AuthRepo>()));
    gh.lazySingleton<_i574.HomeCubit>(
      () => _i574.HomeCubit(gh<_i959.HomeRepo>()),
    );
    gh.factory<_i377.ProfileRepo>(
      () => _i108.ProfileRepoImp(gh<_i492.ProfileDataSource>()),
    );
    gh.factory<_i615.CartRepo>(
      () => _i486.CartRepoImp(gh<_i152.CartDataSource>()),
    );
    gh.factory<_i628.WishlistCubit>(
      () => _i628.WishlistCubit(wishlistRepo: gh<_i437.WishlistRepo>()),
    );
    gh.factory<_i184.ProfileCubit>(
      () => _i184.ProfileCubit(gh<_i377.ProfileRepo>()),
    );
    gh.singleton<_i223.CartCubit>(() => _i223.CartCubit(gh<_i615.CartRepo>()));
    return this;
  }
}
