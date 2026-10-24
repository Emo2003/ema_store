import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/widget/custom_elevate_btn.dart';
import 'package:ema_store/core/widget/custom_loading.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ema_store/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ema_store/features/payment/presentation/manager/payment_cubit.dart';
import 'package:ema_store/features/payment/presentation/manager/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/payment_selection_card.dart';

class PaymentBottomSheet extends StatelessWidget {
  final String amount;
  final String currency;

  const PaymentBottomSheet({
    super.key,
    this.amount = '100',
    this.currency = 'USD',
  });

  static Future<void> show(
    BuildContext context, {
    String amount = '100',
    String currency = 'USD',
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => PaymentBottomSheet(amount: amount, currency: currency),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = ColorManager.primary;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag Handle
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            16.verticalSpace,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded),
                  color: Colors.grey.shade600,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            16.verticalSpace,

            BlocConsumer<PaymentCubit, PaymentState>(
              listener: (context, state) async {
                if (state is PaymentLoading) {
                  CustomLoadingDialog.show(context);
                }
                if (state is PaymentFailure) {
                  CustomLoadingDialog.hide(context);
                  _showSnackBar(context, state.message, ColorManager.error);
                }

                if (state is PaymentSuccess) {
                  CustomLoadingDialog.hide(context);
                  final cartCubit = context.read<CartCubit>();

                  if (cartCubit.cartId == null ||
                      cartCubit.shippingAddress == null) {
                    _showSnackBar(
                      context,
                      'Payment succeeded, but cart or shipping address is missing.',
                    );
                    return;
                  }

                  await cartCubit.createOrder(
                    cartCubit.cartId!,
                    cartCubit.shippingAddress!,
                  );

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                }
              },
              builder: (context, state) {
                final isLoading = state is PaymentLoading;

                return Column(
                  children: [
                    PaymentOptionCard(primaryColor: primary),
                    24.verticalSpace,
                    CustomElevateBtn(
                      text: isLoading ? 'Processing...' : 'Pay Online',
                      onPressed: isLoading
                          ? null
                          : () => _onPayPressed(context),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onPayPressed(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    if (cartCubit.cartId == null || cartCubit.shippingAddress == null) {
      _showSnackBar(context, 'Cart or shipping address not found.');
      return;
    }

    context.read<PaymentCubit>().makePayment(
      paymentIntentInputModel: PaymentIntentInputModel(
        amount: amount,
        currency: currency,
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message, [Color? color]) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }
}
