import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CustomElevateBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CustomElevateBtn({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        minimumSize: Size(350.w, 50.h),
      ),

      onPressed: () {
        onPressed?.call();
      },

      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: ColorManager.white,
        ),
      ),
    );
  }
}
