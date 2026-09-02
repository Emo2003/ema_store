import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cart/presentation/manager/cart_cubit.dart';

class ContainerNumberCart extends StatelessWidget {
  const ContainerNumberCart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(3.r),
      constraints: BoxConstraints(
        minWidth: 18.w,
        minHeight: 18.h,
      ),
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Text(
        context
            .watch<CartCubit>()
            .cartItems
            .length
            .toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
