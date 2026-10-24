import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentOptionCard extends StatelessWidget {
  final Color primaryColor;

  const PaymentOptionCard({
    super.key,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: primaryColor,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.credit_card_rounded,
            color: primaryColor,
            size: 26.sp,
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Credit / Debit Card',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                2.verticalSpace,
                Text(
                  'Powered by Stripe',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.check_circle_rounded,
            color: primaryColor,
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}