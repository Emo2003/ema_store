import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class PaymentCard extends StatelessWidget {
  final int selectedPayment;
  final VoidCallback? onTap;

  const PaymentCard({super.key, required this.selectedPayment, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: selectedPayment == 0
                ? ColorManager.primary
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.money_outlined,
              color: ColorManager.primary,
              size: 30.sp,
            ),

            12.horizontalSpace,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cash on Delivery",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  4.verticalSpace,

                  Text(
                    "Pay when your order arrives",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              selectedPayment == 0
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}
