import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/features/category/presentation/pages/category_page.dart';
import 'package:ema_store/features/category/presentation/pages/products_details.dart';
import 'package:ema_store/features/category/presentation/pages/products_page.dart';
import 'package:ema_store/features/home/presentation/pages/layout_page.dart';
import 'package:ema_store/features/profile/presentation/pages/address.dart';
import 'package:ema_store/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';

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
          builder: (_) => _wrapWithCanPop(const LayoutPage()),
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
          builder: (_) => _wrapWithCanPop(const ProductsPage()),
        );
      case AppRoutesNames.productsDetails:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const ProductsDetails()),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => _wrapWithCanPop(const Placeholder()),
        );
    }
  }
}
