import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widget/custom_outline_btn.dart';
import '../../data/models/WishListProducts.dart';
import 'delete_button.dart';

class WishCardDetails extends StatelessWidget {
  final VoidCallback? onTap;
  final Wishlistproducts product;

  const WishCardDetails({super.key, this.onTap, required this.product});

  @override
  Widget build(BuildContext context) {
    final price = product.price ?? 0;
    final discountPrice = product.priceAfterDiscount ?? 0;

    final hasDiscount = discountPrice > 0 && discountPrice < price;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                product.title ?? '',
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

            DeleteButton(onTap: onTap),
          ],
        ),

        3.verticalSpace,
        Row(
          children: [
            Text(
              "${hasDiscount ? discountPrice : price} EGP",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,
              ),
            ),

            if (hasDiscount) ...[
              7.horizontalSpace,

              Text(
                "$price EGP",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ],
        ),

        3.verticalSpace,
        Row(
          children: [
            Icon(Icons.star_rounded, color: Colors.orangeAccent, size: 17.sp),

            3.horizontalSpace,

            Text(
              "Review ${product.ratingsAverage ?? 0}",
              style: TextStyle(
                fontSize: 12.sp,
                color: ColorManager.primary.withAlpha(150),
                fontWeight: FontWeight.w600,
              ),
            ),

            4.horizontalSpace,

            Text(
              "${product.ratingsQuantity ?? 0} Ratings",
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
              onPressed: () {
                // Add to cart
              },
              text: "Add to Cart",
              isLogout: false,
              width: 50.w,
            ),
          ),
        ),
      ],
    );
  }
}
