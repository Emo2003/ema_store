import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class PaymentCard extends StatelessWidget {
  final int selectedPayment;
  final Function(int) onTap;

  const PaymentCard({
    super.key,
    required this.selectedPayment,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cash on Delivery
        _PaymentOption(
          title: "Cash on Delivery",
          subtitle: "Pay when your order arrives",
          icon: Icons.money_outlined,
          isSelected: selectedPayment == 0,
          onTap: () => onTap(0),
        ),

        10.verticalSpace,

        // Card Payment
        _PaymentOption(
          title: "Card Payment",
          subtitle: "Pay securely using your card",
          icon: Icons.credit_card,
          isSelected: selectedPayment == 1,
          onTap: () => onTap(1),
        ),
      ],
    );
  }
}

class _PaymentOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? ColorManager.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: ColorManager.primary, size: 30.sp),

            12.horizontalSpace,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  4.verticalSpace,

                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}
