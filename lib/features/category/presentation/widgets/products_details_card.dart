import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../home/data/models/products/Products.dart';

class ProductsDetailsCard extends StatelessWidget {
  final Products product;
  final int quantity;
  final double productPrice;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;

  const ProductsDetailsCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.productPrice,
    this.onIncrement,
    this.onDecrement,
    this.isFavorite = false,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  product.title ?? '',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.primary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              Text(
                " ${productPrice.toStringAsFixed(1)}  EGP",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              Text(
                "${product.ratingsAverage} (${product.ratingsQuantity})",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.primary.withAlpha(170),
                ),
              ),
              5.horizontalSpace,
              Icon(Icons.star, color: Colors.orangeAccent, size: 21.sp),
              Spacer(),
              Container(
                width: 100.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        if (onDecrement != null) {
                          onDecrement!();
                        }
                      },
                      child: Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorManager.secondary,
                            width: 1.5.h,
                          ),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: ColorManager.secondary,
                          size: 23.sp,
                        ),
                      ),
                    ),
                    Text(
                      "$quantity",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.secondary,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (onIncrement != null) {
                          onIncrement!();
                        }
                      },
                      child: Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorManager.secondary,
                            width: 1.7.h,
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: ColorManager.secondary,
                          size: 23.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          20.verticalSpace,
          Text(
            "Product Description",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ColorManager.primary,
            ),
          ),
          10.verticalSpace,
          Text(
            product.description ?? '',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: ColorManager.primary.withAlpha(150),
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
