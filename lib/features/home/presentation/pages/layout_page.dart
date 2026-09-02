import 'package:ema_store/core/resources/assets_manager.dart';
import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/config/get_config.dart';
import 'package:ema_store/features/category/presentation/pages/category_page.dart';
import 'package:ema_store/features/home/presentation/widget/container_number_cart.dart';
import 'package:ema_store/features/home/presentation/widget/container_number_wishlist.dart';
import 'package:ema_store/features/profile/presentation/manager/profile_cubit.dart';
import 'package:ema_store/features/profile/presentation/pages/profile_page.dart';
import 'package:ema_store/features/wishlist/presentation/pages/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../cart/presentation/manager/cart_cubit.dart';
import '../../../cart/presentation/pages/cart_page.dart';
import '../../../wishlist/presentation/manager/wishlist_cubit.dart';
import 'home_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  void openCartTab() {
    setState(() {
      _selectedIndex = 2;
    });

    context.read<CartCubit>().getCartItems();
  }

  int _selectedIndex = 0;

  late final List<Widget> tabs;

  @override
  void initState() {
    super.initState();

    tabs = [
      HomePage(
        onViewAllCategories: () {
          setState(() {
            _selectedIndex = 1;
          });
        },
        onOpenCart: openCartTab,
      ),

      CategoryPage(onOpenCart: openCartTab),

      const CartPage(),

      const WishlistPage(),

      BlocProvider(
        create: (_) => getIt<ProfileCubit>(),
        child: const ProfilePage(),
      ),
    ];
  }

  Widget circularIcon({
    required String icon,
    required bool isSelected,
    double size = 20,
  }) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? ColorManager.secondary : Colors.transparent,
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(icon, width: size, height: size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.secondary,

        body: tabs[_selectedIndex],

        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorManager.primary,
            currentIndex: _selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,

            items: [
              BottomNavigationBarItem(
                icon: circularIcon(icon: IconsAssets.home, isSelected: false),
                activeIcon: circularIcon(
                  icon: IconsAssets.homeActive,
                  isSelected: true,
                ),
                label: '',
              ),

              BottomNavigationBarItem(
                icon: circularIcon(
                  icon: IconsAssets.category,
                  isSelected: false,
                ),
                activeIcon: circularIcon(
                  icon: IconsAssets.categoryActive,
                  isSelected: true,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    circularIcon(icon: IconsAssets.cart, isSelected: false),
                    if (context.watch<CartCubit>().cartItems.isNotEmpty)
                      Positioned(
                        right: -6,
                        top: -6,
                        child: ContainerNumberCart(),
                      ),
                  ],
                ),
                activeIcon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    circularIcon(
                      icon: IconsAssets.cartActive,
                      isSelected: true,
                    ),
                    if (context.watch<CartCubit>().cartItems.isNotEmpty)
                      Positioned(
                        right: -6,
                        top: -6,
                        child: ContainerNumberCart(),
                      ),
                  ],
                ),
                label: '',
              ),

              BottomNavigationBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    circularIcon(icon: IconsAssets.fav, isSelected: false),
                    if (context.watch<WishlistCubit>().wishlistItems.isNotEmpty)
                      Positioned(right: -6, top: -6, child: ContainerNumber()),
                  ],
                ),
                activeIcon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    circularIcon(icon: IconsAssets.favActive, isSelected: true),
                    if (context.watch<WishlistCubit>().wishlistItems.isNotEmpty)
                      Positioned(right: -6, top: -6, child: ContainerNumber()),
                  ],
                ),
                label: '',
              ),

              BottomNavigationBarItem(
                icon: circularIcon(
                  icon: IconsAssets.profile,
                  isSelected: false,
                ),
                activeIcon: circularIcon(
                  icon: IconsAssets.profileActive,
                  isSelected: true,
                ),
                label: '',
              ),
            ],

            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
