import 'package:ema_store/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class CartCard extends StatelessWidget {
  final CartItem item;
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

        child: Expanded(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSICmPX7HVrXVG2gS_IWLY_caJf42RHkS3GgaBlU_cUAQ&s=10',
                  width: 100.w,
                  height: double.infinity,
                  fit: BoxFit.cover,

                  errorBuilder: (_, _, _) {
                    return Container(
                      width: 100.w,
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hot Sale Product',
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
                      '${item.price.toInt()} EGP',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                spacing: 3.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: onIncrement,
                    borderRadius: BorderRadius.circular(20.r),
                    child: Container(
                      width: 27.w,
                      height: 27.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorManager.primary, width: 1),
                      ),
                      child: Icon(
                        Icons.add,
                        color: ColorManager.primary,
                        size: 19.sp,
                      ),
                    ),
                  ),

                  12.horizontalSpace,

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 11.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      '${item.quantity}',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.secondary,
                      ),
                    ),
                  ),

                  12.horizontalSpace,
                  InkWell(
                    onTap: onDecrement,
                    borderRadius: BorderRadius.circular(20.r),
                    child: Container(
                      width: 27.w,
                      height: 27.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorManager.primary, width: 1),
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
      ),
    );
  }
}
