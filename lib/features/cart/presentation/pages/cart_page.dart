import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_elevate_btn.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:ema_store/features/cart/data/models/cart/Products.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_state.dart';
import 'package:ema_store/features/cart/presentation/widgets/cart_card.dart';
import 'package:ema_store/features/cart/presentation/widgets/order_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final double deliveryFee = 100;

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCartItems();
  }

  double getSubtotal(List<Products> items) {
    return items.fold(
      0,
      (sum, item) => sum + ((item.price ?? 0) * (item.count ?? 0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.h),
        child: CustomInsideAppBar(title: "My Cart", showBackButton: false),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartItemsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? "An error occurred"),
                backgroundColor: ColorManager.error,
              ),
            );
          }

          if (state is CartRemovingSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message ?? "Item removed from cart successfully",
                ),
                backgroundColor: ColorManager.primary,
              ),
            );
          }

          if (state is CartRemovingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? "Failed to remove item"),
                backgroundColor: ColorManager.error,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CartItemsLoading) {
            return Center(
              child: CircularProgressIndicator(color: ColorManager.primary),
            );
          }

          if (state is CartItemsError) {
            return Center(
              child: Text(
                state.errorMessage ?? "An error occurred",
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state is CartItemsSuccess) {
            final items = state.cartItems;
            final subtotal = getSubtotal(items);
            final total = subtotal + (items.isEmpty ? 0 : deliveryFee);

            return Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cart Items",
                        style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${items.length} Items",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primary,
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  Expanded(
                    child: items.isEmpty
                        ? Center(
                            child: Text(
                              "Your cart is empty",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : ListView.separated(
                            itemCount: items.length,
                            separatorBuilder: (_, _) => 10.verticalSpace,
                            itemBuilder: (context, index) {
                              final item = items[index];

                              return CartCard(
                                item: item,
                                onIncrement: () {
                                  final productId = item.product?.id;

                                  if (productId == null) return;

                                  final currentCount = (item.count ?? 0)
                                      .toInt();

                                  context
                                      .read<CartCubit>()
                                      .updateCartItemQuantity(
                                        productId,
                                        currentCount + 1,
                                      );
                                },
                                onDecrement: () {
                                  final productId = item.product?.id;

                                  if (productId == null) return;

                                  final currentCount = (item.count ?? 0)
                                      .toInt();

                                  if (currentCount <= 1) return;

                                  context
                                      .read<CartCubit>()
                                      .updateCartItemQuantity(
                                        productId,
                                        currentCount - 1,
                                      );
                                },
                                onDismiss: () {
                                  final productId = item.product?.id;

                                  if (productId == null) return;

                                  context.read<CartCubit>().removeFromCart(
                                    productId,
                                  );
                                },
                              );
                            },
                          ),
                  ),
                  12.verticalSpace,
                  OrderSummaryCard(
                    onCheckout: items.isEmpty
                        ? null
                        : () {
                            Navigator.pushNamed(
                              context,
                              AppRoutesNames.checkout,
                            );
                          },
                    subTotal: subtotal,
                    deliveryFee: items.isEmpty ? 0 : deliveryFee,
                    total: total,
                  ),
                  25.verticalSpace,
                  CustomElevateBtn(
                    onPressed: items.isEmpty
                        ? null
                        : () {
                            Navigator.pushNamed(
                              context,
                              AppRoutesNames.checkout,
                            );
                          },
                    text: "Checkout",
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
