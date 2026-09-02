import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cart/presentation/manager/cart_cubit.dart';
import '../../../cart/presentation/manager/cart_state.dart';
import '../widgets/order_card.dart';
import '../widgets/order_error_widget.dart';
import '../widgets/orders_empty.dart';


class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<CartCubit>().getOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,

      appBar:PreferredSize(preferredSize: const Size.fromHeight(80), child:   CustomInsideAppBar(
        title: 'My Orders',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),),

      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            );
          }

          if (state is OrdersError) {
            return OrdersErrorWidget(
              message: state.errorMessage,
              onRetry: () {
                context.read<CartCubit>().getOrders();
              },
            );
          }

          if (state is OrdersSuccess) {
            final orders = state.orders;

            if (orders.isEmpty) {
              return const OrdersEmpty();
            }

            return RefreshIndicator(
              color: ColorManager.primary,
              onRefresh: () async {
                await context.read<CartCubit>().getOrders();
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  16.w,
                  12.h,
                  16.w,
                  24.h,
                ),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return OrderCard(
                    order: orders[index],
                  );
                },
              ),
            );
          }

          return const OrdersEmpty();
        },
      ),
    );
  }
}