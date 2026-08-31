import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widget/custom_elevate_btn.dart';

class FooterCard extends StatelessWidget {
  final num totalPrice;
  const FooterCard({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, left: 5.w, right: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorManager.secondary,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withAlpha(50),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Total Price",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.primary.withAlpha(150),
                ),
              ),
              5.verticalSpace,
              Text(
                " ${totalPrice.toStringAsFixed(1)}  EGP",
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w900,
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),
          30.horizontalSpace,
          CustomElevateBtn(
            onPressed: () {},
            text: "Add to Cart",
            width: 150.w,
            isCart: true,
          ),
        ],
      ),
    );
  }
}
