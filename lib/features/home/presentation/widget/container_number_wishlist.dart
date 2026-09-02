import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../wishlist/presentation/manager/wishlist_cubit.dart';

class ContainerNumber extends StatelessWidget {
  const ContainerNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            .watch<WishlistCubit>()
            .wishlistItems
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
