import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CustomOutlineBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLogout;
  final double? width;
  const CustomOutlineBtn({super.key,
    required this.onPressed,
    required this.text,
    this.isLogout = true,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        onPressed?.call();
      },
      icon: (isLogout)? Icon(
        Icons.logout_rounded,
        color: ColorManager.primary,
        size: 21.sp,
      ): const SizedBox.shrink(),
      label: Text(
        text,
        style: TextStyle(
          color: ColorManager.primary,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: ColorManager.primary, width: 1.2.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        minimumSize: Size(width ?? 170.w, 30.h),
      ),
    );
  }
}
