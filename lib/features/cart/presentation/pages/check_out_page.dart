import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_elevate_btn.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:ema_store/features/cart/presentation/widgets/order_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/address_card.dart';
import '../widgets/payment_card.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.h),
        child: CustomInsideAppBar(title: 'Check Out'),
      ),

      body: SingleChildScrollView(
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
            25.verticalSpace,

            AddressCard(),
            40.verticalSpace,

            Text(
              "Payment Method",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.black,
              ),
            ),
            25.verticalSpace,

            PaymentCard(
              selectedPayment: selectedPayment,
              onTap: () {
                setState(() {
                  selectedPayment = 0;
                });
              },
            ),

            50.verticalSpace,
            OrderSummaryCard(subTotal: 400, deliveryFee: 100, total: 500),

            30.verticalSpace,

            CustomElevateBtn(
              text: "Place Order",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesNames.placeOrders);
              },
            ),

            5.verticalSpace,
          ],
        ),
      ),
    );
  }
}
