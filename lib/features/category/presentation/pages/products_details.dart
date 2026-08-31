import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/features/category/presentation/widgets/product_image.dart';
import 'package:ema_store/features/category/presentation/widgets/product_small_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/presentation/manager/home_cubit.dart';
import '../widgets/footer_card.dart';
import '../widgets/products_details_card.dart';

class ProductsDetails extends StatefulWidget {
  const ProductsDetails({super.key});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  num quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final product = cubit.selectedProduct;

    if (product == null) {
      return const Scaffold(body: Center(child: Text('Product not found')));
    }

    final num productPrice = product.priceAfterDiscount ?? product.price ?? 0.0;
    final num totalPrice = quantity * productPrice;

    return Scaffold(
      backgroundColor: ColorManager.secondary,
      body: Column(
        children: [
          ProductImage(product: product),
          20.verticalSpace,
          ProductSmallImages(product: product),
          20.verticalSpace,
          ProductsDetailsCard(
            product: product,
            quantity: quantity.toInt(),
            productPrice: productPrice.toDouble(),
            onIncrement: () {
              setState(() {
                quantity++;
              });
            },
            onDecrement: () {
              if (quantity > 1) {
                setState(() {
                  quantity--;
                });
              }
            },
          ),
          Spacer(),
          FooterCard(totalPrice: totalPrice),
        ],
      ),
    );
  }
}
