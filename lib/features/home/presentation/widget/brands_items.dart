import 'package:ema_store/features/home/data/models/brands/brands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class BrandsItems extends StatelessWidget {
  final List<Brands> brands;
  final Function(Brands) onTap;

  const BrandsItems({super.key, required this.brands, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.w,
          crossAxisSpacing: 8.h,
          childAspectRatio: 0.7,
        ),
        itemCount: brands.length,
        itemBuilder: (context, index) {
          final brand = brands[index];
          return InkWell(
            onTap: () => onTap(brand),
            child: Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.primary.withAlpha(50),
                    blurRadius: 2.5.r,
                    offset: Offset(5.w, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Image.network(
                  brands[index].image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
