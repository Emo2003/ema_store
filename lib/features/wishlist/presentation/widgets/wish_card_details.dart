import 'package:ema_store/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widget/custom_outline_btn.dart';
import '../../data/models/WishListProducts.dart';

class WishCardDetails extends StatelessWidget {
  final VoidCallback? onTap;
  final Wishlistproducts product;

  const WishCardDetails({super.key, this.onTap, required this.product});

  @override
  Widget build(BuildContext context) {
    final price = product.price ?? 0;
    final discountPrice = product.priceAfterDiscount ?? 0;
    final hasDiscount = discountPrice > 0 && discountPrice < price;
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAddedSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message ?? "Product added to cart successfully",
              ),
              backgroundColor: ColorManager.primary,
            ),
          );
        }
        if (state is CartAddedError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage ?? "Failed to add product to cart",
              ),
              backgroundColor: ColorManager.error,
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  product.title ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary,
                  ),
                ),
              ),
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
                  final productId = product.id;
                  if (productId == null || productId.isEmpty) {
                    return;
                  }
                  context.read<CartCubit>().addToCart(productId);
                },
                text: "Add to Cart",
                isLogout: false,
                width: 50.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
