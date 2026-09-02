import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_elevate_btn.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_state.dart';
import 'package:ema_store/features/profile/presentation/manager/profile_cubit.dart';
import 'package:ema_store/features/profile/presentation/manager/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/address_card.dart';
import '../widgets/payment_card.dart';
import '../widgets/order_summary_card.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int selectedPayment = 0;

  final double deliveryFee = 100;

  @override
  void initState() {
    super.initState();

    context.read<ProfileCubit>().getAddresses();
  }

  double getSubtotal(CartCubit cubit) {
    return cubit.cartItems.fold(
      0,
      (sum, item) => sum + ((item.price ?? 0) * (item.count ?? 0)),
    );
  }

  void placeOrder() {
    final cartCubit = context.read<CartCubit>();
    final profileCubit = context.read<ProfileCubit>();

    if (cartCubit.cartItems.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Your cart is empty")));
      return;
    }

    if (cartCubit.cartId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Cart ID not found")));
      return;
    }

    final profileState = profileCubit.state;

    if (profileState is! ProfileGetSuccessState ||
        profileState.addresses.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please add a delivery address")),
      );
      return;
    }

    final address = profileState.addresses.first;

    final shippingAddress = {
      "details": address.details ?? "",
      "phone": address.phone ?? "",
      "city": address.city ?? "",
    };

    if (selectedPayment == 1) {
      cartCubit.shippingAddress = shippingAddress;

      Navigator.pushNamed(context, AppRoutesNames.payment);

      return;
    }

    cartCubit.createOrder(cartCubit.cartId!, shippingAddress);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is OrderCreatingSuccess) {
          Navigator.pushNamed(context, AppRoutesNames.placeOrders);
        }

        if (state is OrderCreatingError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? "Error creating order"),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.secondary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: CustomInsideAppBar(title: 'Check Out'),
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cartCubit = context.read<CartCubit>();

            final subtotal = getSubtotal(cartCubit);
            final total = subtotal + deliveryFee;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Address",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black,
                    ),
                  ),
                  15.verticalSpace,
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileGetLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is ProfileGetErrorState) {
                        return Center(
                          child: Text(
                            state.message,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.red,
                            ),
                          ),
                        );
                      }

                      if (state is ProfileGetSuccessState) {
                        if (state.addresses.isEmpty) {
                          return Center(
                            child: Text(
                              'No addresses found',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        }

                        return AddressCard(address: state.addresses.first);
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                  20.verticalSpace,
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black,
                    ),
                  ),
                  15.verticalSpace,
                  PaymentCard(
                    selectedPayment: selectedPayment,
                    onTap: (value) {
                      setState(() {
                        selectedPayment = value;
                      });
                    },
                  ),
                  30.verticalSpace,
                  OrderSummaryCard(
                    subTotal: subtotal,
                    deliveryFee: deliveryFee,
                    total: total,
                  ),
                  30.verticalSpace,
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      final isLoading = state is OrderCreatingLoading;

                      return CustomElevateBtn(
                        text: isLoading ? "Placing Order..." : "Place Order",
                        onPressed: isLoading ? null : placeOrder,
                      );
                    },
                  ),
                  5.verticalSpace,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
