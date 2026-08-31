import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widget/custom_outline_btn.dart';
import 'delete_button.dart';

class WishCardDetails extends StatelessWidget {
  final VoidCallback? onTap;
  const WishCardDetails({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Product Name",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary,
                  ),
                ),
              ),
              5.horizontalSpace,
              DeleteButton(onTap: () {
                onTap?.call();
              }),
            ],
          ),
          3.verticalSpace,
          Row(
            children: [
              Text(
                "80 EGP",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primary,
                ),
              ),
              7.horizontalSpace,
              Text(
                "100 EGP",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          3.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: Colors.orangeAccent,
                size: 17.sp,
              ),
              3.horizontalSpace,
              Text(
                "4.2",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorManager.primary.withAlpha(150),
                  fontWeight: FontWeight.w600,
                ),
              ),
              4.horizontalSpace,
              Text(
                "(120)",
                style: TextStyle(fontSize: 11.sp, color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 32.h,
              child: CustomOutlineBtn(
                onPressed: () {},
                text: "Add to Cart",
                isLogout: false,
                width: 50.w,
              ),
            ),
          ),
        ],
      ),
    )
    ;
  }
}
