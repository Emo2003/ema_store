import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_elevate_btn.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final formKey = GlobalKey<FormState>();

  final cardNumberController = TextEditingController();
  final cardHolderController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    cardNumberController.dispose();
    cardHolderController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  Future<void> processPayment() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final cartCubit = context.read<CartCubit>();

    if (cartCubit.cartId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Cart not found")));
      return;
    }

    if (cartCubit.shippingAddress == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Shipping address not found")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    cartCubit.createOrder(cartCubit.cartId!, cartCubit.shippingAddress!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is OrderCreatingLoading) {
          if (!isLoading) {
            setState(() {
              isLoading = true;
            });
          }
        }

        if (state is OrderCreatingSuccess) {
          setState(() {
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? "Order created successfully"),
              duration: const Duration(seconds: 1),
            ),
          );

          Future.delayed(const Duration(milliseconds: 500), () {
            if (!mounted) return;

            Navigator.pushReplacementNamed(context, AppRoutesNames.placeOrders);
          });
        }

        if (state is OrderCreatingError) {
          setState(() {
            isLoading = false;
          });

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
          child: CustomInsideAppBar(title: 'Payment'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.credit_card, size: 45.sp, color: Colors.white),
                      20.verticalSpace,
                      Text(
                        "Secure Payment",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        "Enter your card details to complete your payment.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                30.verticalSpace,
                Text(
                  "Card Number",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.verticalSpace,
                TextFormField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                  ],
                  decoration: InputDecoration(
                    hintText: "1234567890123456",
                    prefixIcon: const Icon(Icons.credit_card),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter card number";
                    }

                    if (value.length != 16) {
                      return "Card number must be 16 digits";
                    }

                    return null;
                  },
                ),
                20.verticalSpace,
                Text(
                  "Card Holder Name",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.verticalSpace,
                TextFormField(
                  controller: cardHolderController,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Enter card holder name",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Enter card holder name";
                    }

                    if (value.trim().length < 3) {
                      return "Enter a valid name";
                    }

                    return null;
                  },
                ),
                20.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expiry Date",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          10.verticalSpace,
                          TextFormField(
                            controller: expiryController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            decoration: InputDecoration(
                              hintText: "MM/YY",
                              prefixIcon: const Icon(Icons.calendar_month),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter expiry";
                              }

                              if (value.length != 4) {
                                return "Invalid";
                              }

                              final month = int.tryParse(value.substring(0, 2));

                              if (month == null || month < 1 || month > 12) {
                                return "Invalid";
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    15.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CVV",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          10.verticalSpace,
                          TextFormField(
                            controller: cvvController,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            decoration: InputDecoration(
                              hintText: "CVV",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter CVV";
                              }

                              if (value.length != 3) {
                                return "Invalid CVV";
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                40.verticalSpace,
                CustomElevateBtn(
                  text: isLoading ? "Processing..." : "Pay Now",
                  onPressed: isLoading ? null : processPayment,
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
