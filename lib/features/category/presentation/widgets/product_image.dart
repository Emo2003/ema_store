import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../home/data/models/products/Products.dart';

class ProductImage extends StatelessWidget {
  final Products product;
  const ProductImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.r),
            bottomRight: Radius.circular(25.r),
          ),
          child: Image.network(
            product.imageCover ?? '',
            fit: BoxFit.fill,
            width: double.infinity,
            height: 330.h,
          ),
        ),
        Positioned(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 16.w),
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: ColorManager.secondary,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: ColorManager.primary,
                    size: 20.sp,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35.h, right: 16.w),
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: ColorManager.secondary,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline_outlined,
                    color: ColorManager.primary,
                    size: 22.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
