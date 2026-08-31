import 'package:ema_store/features/wishlist/presentation/widgets/wish_card_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../data/models/WishListProducts.dart';
import '../manager/wishlist_cubit.dart';

class WishlistCard extends StatelessWidget {
  final Wishlistproducts wishlistProducts;

  const WishlistCard({super.key, required this.wishlistProducts});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withAlpha(25),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: Image.network(
              wishlistProducts.imageCover ?? '',
              width: 105.w,
              height: 128.h,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return Container(
                  width: 105.w,
                  height: 128.h,
                  color: ColorManager.secondary,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: ColorManager.primary.withAlpha(100),
                  ),
                );
              },
            ),
          ),

          12.horizontalSpace,

          Expanded(
            child: WishCardDetails(
              product: wishlistProducts,
              onTap: () {
                context.read<WishlistCubit>().removeFromWishlist(
                  wishlistProducts.id ?? '',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
