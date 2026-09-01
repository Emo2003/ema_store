import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_elevate_btn.dart';
import 'package:flutter/material.dart';

class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Text(
            "Order Confirmed",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            "Thank you for your order! Your order has been successfully placed.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 40),
          CustomElevateBtn(
            orderConfirmed: true,
            text: "Continue Shopping",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutesNames.layout,
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
