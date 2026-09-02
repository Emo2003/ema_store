import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../data/models/cart/Products.dart';

class CartCard extends StatelessWidget {
  final Products item;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onDismiss;

  const CartCard({
    super.key,
    required this.item,
    this.onIncrement,
    this.onDecrement,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,

      onDismissed: (_) {
        onDismiss?.call();
      },

      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Icon(
          Icons.delete_outline_rounded,
          color: Colors.white,
          size: 26.sp,
        ),
      ),

      child: Container(
        height: 120.h,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(
            color: ColorManager.primary.withAlpha(100),
            width: 1.2.w,
          ),
        ),

        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: Image.network(
                item.product?.imageCover ?? '',
                width: 100.w,
                height: 100.h,
                fit: BoxFit.cover,

                errorBuilder: (_, _, _) {
                  return Container(
                    width: 100.w,
                    height: 100.h,
                    color: Colors.grey.shade200,
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: Colors.grey.withAlpha(100),
                      size: 30.sp,
                    ),
                  );
                },
              ),
            ),

            15.horizontalSpace,

            // Product Info
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product?.title ?? 'Product',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  8.verticalSpace,

                  Text(
                    '${item.price ?? 0} EGP',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primary,
                    ),
                  ),
                ],
              ),
            ),

            10.horizontalSpace,

            // Quantity Controls
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Increment
                InkWell(
                  onTap: onIncrement,
                  borderRadius: BorderRadius.circular(20.r),
                  child: Container(
                    width: 27.w,
                    height: 27.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: ColorManager.primary,
                      size: 19.sp,
                    ),
                  ),
                ),

                5.verticalSpace,

                // Current Cart Quantity
                Container(
                  constraints: BoxConstraints(
                    minWidth: 35.w,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    '${item.count ?? 0}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w900,
                      color: ColorManager.secondary,
                    ),
                  ),
                ),

                5.verticalSpace,

                // Decrement
                InkWell(
                  onTap: onDecrement,
                  borderRadius: BorderRadius.circular(20.r),
                  child: Container(
                    width: 27.w,
                    height: 27.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: ColorManager.primary,
                      size: 19.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}