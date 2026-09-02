import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_elevate_btn.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartClearingSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutesNames.layout,
            (route) => false,
          );
        }

        if (state is CartClearingError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? "Failed to clear cart"),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.secondary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green.shade700, width: 4),
                  ),
                  child: const Icon(Icons.check, color: Colors.green, size: 60),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Order Confirmed",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Thank you for your order! Your order has been successfully placed.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),
                CustomElevateBtn(
                  orderConfirmed: true,
                  text: "Continue Shopping",
                  onPressed: () {
                    context.read<CartCubit>().clearCart();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
