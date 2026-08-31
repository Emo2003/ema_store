import 'package:ema_store/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddAddressButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.black,
          foregroundColor: ColorManager.white,
          disabledBackgroundColor: Colors.grey.shade400,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Text(
          'Add Address',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}