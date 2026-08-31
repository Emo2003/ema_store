import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback? onTap;

  const DeleteButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.error.withAlpha(20),
        ),
        child: Icon(
          Icons.delete_outline_rounded,
          color: ColorManager.error,
          size: 25.sp,
        ),
      ),
    );
  }
}
