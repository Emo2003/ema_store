import 'package:ema_store/core/resources/assets_manager.dart';
import 'package:ema_store/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/color_manager.dart';
import 'home_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int _selectedIndex = 0;

  final List<Widget> tabs = [
    const HomePage(),
    const Center(child: Text('Category Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Fav Page', style: TextStyle(fontSize: 24))),
    const ProfilePage(),
  ];

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
                size: 20,
              ),
              activeIcon: circularIcon(
                icon: IconsAssets.homeActive,
                isSelected: true,
                size: 20,
              ),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: circularIcon(
                icon: IconsAssets.category,
                isSelected: false,
                size: 20,
              ),
              activeIcon: circularIcon(
                icon: IconsAssets.categoryActive,
                isSelected: true,
                size: 20,
              ),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: circularIcon(
                icon: IconsAssets.fav,
                isSelected: false,
                size: 20,
              ),
              activeIcon: circularIcon(
                icon: IconsAssets.favActive,
                isSelected: true,
                size: 20,
              ),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: circularIcon(icon: IconsAssets.profile, isSelected: false, size: 20),
              activeIcon: circularIcon(
                icon: IconsAssets.profileActive,
                isSelected: true,
                size: 20,
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
