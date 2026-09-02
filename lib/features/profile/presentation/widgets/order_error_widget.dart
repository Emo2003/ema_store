import 'package:ema_store/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersErrorWidget extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;

  const OrdersErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 90.w,
              height: 90.w,
              decoration: BoxDecoration(
                color: Colors.red.withAlpha(15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 48.sp,
                color: Colors.redAccent,
              ),
            ),

            20.verticalSpace,

            Text(
              'Something went wrong',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                color: ColorManager.primary,
              ),
            ),

            8.verticalSpace,

            Text(
              message ?? 'Unable to load your orders.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.5.sp,
                height: 1.4,
                color: Colors.grey.shade600,
              ),
            ),

            20.verticalSpace,

            SizedBox(
              height: 44.h,
              child: ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 28.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: const Text(
                  'Try Again',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}