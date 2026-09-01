import 'package:ema_store/core/config/get_config.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/features/auth/presentation/pages/forget_password_page.dart';
import 'package:ema_store/features/auth/presentation/pages/receive_code_page.dart';
import 'package:ema_store/features/auth/presentation/pages/reset_password_page.dart';
import 'package:ema_store/features/cart/presentation/pages/cart_page.dart';
import 'package:ema_store/features/cart/presentation/pages/check_out_page.dart';
import 'package:ema_store/features/cart/presentation/pages/place_order_page.dart';
import 'package:ema_store/features/category/presentation/manager/category_cubit.dart';
import 'package:ema_store/features/category/presentation/pages/category_page.dart';
import 'package:ema_store/features/category/presentation/pages/products_details.dart';
import 'package:ema_store/features/category/presentation/pages/products_page.dart';
import 'package:ema_store/features/home/presentation/pages/layout_page.dart';
import 'package:ema_store/features/profile/presentation/pages/address.dart';
import 'package:ema_store/features/profile/presentation/pages/profile_page.dart';
import 'package:ema_store/features/wishlist/presentation/manager/wishlist_cubit.dart';
import 'package:ema_store/features/wishlist/presentation/pages/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/home/presentation/manager/home_cubit.dart';

class Routes {
  static Widget _wrapWithCanPop(Widget page) {
    return Builder(
      builder: (context) {
        final canPop = Navigator.of(context).canPop();

        return PopScope(
          canPop: canPop,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;

            if (!Navigator.of(context).canPop()) {
              SystemNavigator.pop();
            }
          },
          child: page,
        );
      },
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.login:
        return MaterialPageRoute(builder: (_) => _wrapWithCanPop(LoginPage()));

      case AppRoutesNames.register:
        return MaterialPageRoute(builder: (_) => _wrapWithCanPop(SignupPage()));

      case AppRoutesNames.layout:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<CategoryCubit>()),
              BlocProvider(create: (_) => getIt<HomeCubit>()),
              BlocProvider(create: (_) => getIt<WishlistCubit>()),
            ],
            child: _wrapWithCanPop(const LayoutPage()),
          ),
        );

      case AppRoutesNames.profile:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const ProfilePage()),
        );
      case AppRoutesNames.address:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const Address()),
        );
      case AppRoutesNames.categories:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const CategoryPage()),
        );
      case AppRoutesNames.products:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: getIt<CategoryCubit>()),
                BlocProvider.value(value: getIt<HomeCubit>()),
                BlocProvider.value(
                  value: getIt<WishlistCubit>()..getWishlist(),
                ),
              ],
              child: const ProductsPage(),
            ),
          ),
        );
      case AppRoutesNames.productsDetails:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: getIt<HomeCubit>()),
                BlocProvider.value(
                  value: getIt<WishlistCubit>()..getWishlist(),
                ),
              ],
              child: const ProductsDetails(),
            ),
          ),
        );
      case AppRoutesNames.home:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(LayoutPage()),
        );
      case AppRoutesNames.wishList:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const WishlistPage()),
        );
      case AppRoutesNames.cart:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const CartPage()),
        );
      case AppRoutesNames.checkout:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const CheckOutPage()),
        );
      case AppRoutesNames.placeOrders:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const PlaceOrderPage()),
        );
      case AppRoutesNames.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const ForgetPasswordPage()),
        );
      case AppRoutesNames.receiveCode:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const ReceiveCodePage()),
        );
      case AppRoutesNames.resetPassword:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const ResetPasswordPage()),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const Placeholder()),
        );
    }
  }
}
