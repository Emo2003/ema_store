import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class MenuItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const MenuItems({super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18.r),
        child: Container(
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(18.r),
            boxShadow: [
              BoxShadow(
                color: ColorManager.black.withAlpha(85),
                blurRadius: 8,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 5.w),

            leading: Icon(
              icon,
              color: ColorManager.primary,
              size: 24.sp,
            ),

            title: Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: ColorManager.black,
              ),
            ),

            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorManager.primary,
              size: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
