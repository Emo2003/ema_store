import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
class OrderSummaryCard extends StatelessWidget {
  final num subTotal;
  final num deliveryFee;
  final num total;
  final VoidCallback? onCheckout;

  const OrderSummaryCard({
    super.key,
    required this.subTotal,
    required this.deliveryFee,
    required this.total,
    this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        children: [
          Text(
            "Order Summary",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),

          15.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Subtotal"), Text("${subTotal.toInt()} EGP")],
          ),

          10.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Delivery Fee"),
              Text("${deliveryFee.toInt()} EGP"),
            ],
          ),

          10.verticalSpace,

          const Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Price",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "${total.toInt()} EGP",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
