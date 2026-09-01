import 'package:ema_store/features/wishlist/presentation/manager/wishlist_cubit.dart';
import 'package:ema_store/features/wishlist/presentation/manager/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../home/data/models/products/Products.dart';

class ProductImage extends StatelessWidget {
  final Products product;

  const ProductImage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.read<WishlistCubit>();

    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        final isFavorite = wishlistCubit.isInWishlist(
          product.id!,
        );

        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r),
              ),
              child: Image.network(
                product.imageCover ?? '',
                fit: BoxFit.fill,
                width: double.infinity,
                height: 330.h,
              ),
            ),

            Positioned(
              top: 30.h,
              left: 16.w,
              child: Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: ColorManager.secondary,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: ColorManager.primary,
                    size: 20.sp,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 35.h,
              right: 16.w,
              child: Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: ColorManager.secondary,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (isFavorite) {
                      wishlistCubit.removeFromWishlist(
                        product.id!,
                      );
                    } else {
                      wishlistCubit.addToWishlist(
                        product.id!,
                      );
                    }
                  },
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_outline_rounded,
                    color: ColorManager.primary,
                    size: 22.sp,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}