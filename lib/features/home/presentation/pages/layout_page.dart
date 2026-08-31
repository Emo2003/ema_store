import 'package:ema_store/core/resources/assets_manager.dart';
import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/config/get_config.dart';
import 'package:ema_store/features/category/presentation/pages/category_page.dart';
import 'package:ema_store/features/profile/presentation/manager/profile_cubit.dart';
import 'package:ema_store/features/profile/presentation/pages/profile_page.dart';
import 'package:ema_store/features/wishlist/presentation/pages/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../manager/home_cubit.dart';
import 'home_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int _selectedIndex = 0;

  late final List<Widget> tabs;

  @override
  void initState() {
    super.initState();

    tabs = [
      BlocProvider(
        create: (_) => getIt<HomeCubit>(),
        child: HomePage(
          onViewAllCategories: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
        ),
      ),

      BlocProvider(
        create: (_) => getIt<HomeCubit>()..getAllCategories(),
        child: const CategoryPage(),
      ),
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
        color: isSelected
            ? ColorManager.secondary
            : Colors.transparent,
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        icon,
        width: size,
        height: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              icon: circularIcon(
                icon: IconsAssets.home,
                isSelected: false,
              ),
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
              icon: circularIcon(
                icon: IconsAssets.fav,
                isSelected: false,
              ),
              activeIcon: circularIcon(
                icon: IconsAssets.favActive,
                isSelected: true,
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
    );
  }
}