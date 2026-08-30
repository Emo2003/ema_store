import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CustomOutlineBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const CustomOutlineBtn({super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        onPressed?.call();
      },
      icon: Icon(
        Icons.logout_rounded,
        color: ColorManager.primary,
        size: 21.sp,
      ),
      label: Text(
        text,
        style: TextStyle(
          color: ColorManager.primary,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: ColorManager.primary, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
