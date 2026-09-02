import 'package:ema_store/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersEmpty extends StatelessWidget {
  const OrdersEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 110.w,
              height: 110.w,
              decoration: BoxDecoration(
                color: ColorManager.primary.withAlpha(15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 55.sp,
                color: ColorManager.primary,
              ),
            ),

            24.verticalSpace,

            Text(
              'No Orders Yet',
              style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.w800,
                color: ColorManager.primary,
              ),
            ),

            8.verticalSpace,

            Text(
              'Your placed orders will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}