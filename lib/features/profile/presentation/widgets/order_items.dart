import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/features/cart/data/models/order/CartItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItem extends StatelessWidget {
  final CartItems item;

  const OrderItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final product = item.product;

    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: ColorManager.secondary.withAlpha(90),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          _buildImage(product?.imageCover),

          12.horizontalSpace,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.title ?? 'Unknown Product',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.black,
                  ),
                ),

                7.verticalSpace,

                Text(
                  'Qty: ${item.count ?? 0}',
                  style: TextStyle(
                    fontSize: 11.5.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          10.horizontalSpace,

          Text(
            '${item.price ?? 0}',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w800,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String? image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(11.r),
      child: Image.network(
        image ?? '',
        width: 62.w,
        height: 62.w,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) {
          return Container(
            width: 62.w,
            height: 62.w,
            color: Colors.grey.shade200,
            child: Icon(
              Icons.image_not_supported_outlined,
              color: Colors.grey.shade500,
              size: 22.sp,
            ),
          );
        },
      ),
    );
  }
}