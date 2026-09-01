import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CustomElevateBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final bool isCart;
  final bool orderConfirmed;

  const CustomElevateBtn({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.isCart = false,
    this.orderConfirmed = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: orderConfirmed ? Colors.green : ColorManager.primary,
        minimumSize: Size(width ?? 350.w, 50.h),
      ),

      onPressed: () {
        onPressed?.call();
      },

      child: (isCart)
          ? Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: ColorManager.white,
                  size: 25.sp,
                ),
                10.horizontalSpace,
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.white,
                  ),
                ),
              ],
            )
          : Text(
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
