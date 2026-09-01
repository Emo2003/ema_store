import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:ema_store/features/cart/presentation/widgets/cart_card.dart';
import 'package:ema_store/features/cart/presentation/widgets/order_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/custom_elevate_btn.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class CartItem {
  String id;
  double price;
  int quantity;

  CartItem({required this.id, required this.price, this.quantity = 1});
}

class _CartPageState extends State<CartPage> {
  final double deliveryFee = 100;

  final List<CartItem> items = List.generate(
    4,
    (index) => CartItem(id: 'item_$index', price: 100),
  );

  double get subtotal {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  double get total {
    return subtotal + (items.isEmpty ? 0 : deliveryFee);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.h),
        child: CustomInsideAppBar(title: "My Cart", showBackButton: false),
      ),

      body: items.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : Padding(
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
                    child: ListView.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, _) => 10.verticalSpace,
                      itemBuilder: (context, index) {
                        final item = items[index];

                        return CartCard(
                          item: item,
                          onIncrement: () {
                            setState(() {
                              item.quantity++;
                            });
                          },
                          onDecrement: () {
                            if (item.quantity > 1) {
                              setState(() {
                                item.quantity--;
                              });
                            }
                          },
                          onDismiss: () {
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                        );
                      },
                    ),
                  ),

                  12.verticalSpace,
                  OrderSummaryCard(
                    onCheckout: () {
                      Navigator.pushNamed(context, AppRoutesNames.checkout);
                    },
                    subTotal: subtotal,
                    deliveryFee: items.isEmpty ? 0 : deliveryFee,
                    total: total,
                  ),
                  5.verticalSpace,

                  25.verticalSpace,
                  CustomElevateBtn(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutesNames.checkout);
                    },
                    text: "Checkout",
                  ),
                ],
              ),
            ),
    );
  }
}
