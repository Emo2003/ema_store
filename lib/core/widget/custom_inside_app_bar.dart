import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CustomInsideAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final bool showBackButton;

  const CustomInsideAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: ColorManager.secondary,
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorManager.primary,
        ),
        onPressed: onBackPressed ?? () => Navigator.pop(context),
      )
          : null,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: ColorManager.primary,
        ),
      ),
    );
  }
}