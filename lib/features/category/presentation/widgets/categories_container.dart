import 'package:ema_store/features/home/data/models/categories/Categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class CategoriesContainer extends StatelessWidget {
  final Categories categories;
  final VoidCallback onTap;

  const CategoriesContainer({
    super.key,
    required this.categories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(25.r),

      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.secondary,
          borderRadius: BorderRadius.circular(25.r),

          boxShadow: [
            BoxShadow(
              color: ColorManager.primary.withAlpha(50),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(2, 0),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.r),
                ),

                child: Image.network(
                  categories.image ?? '',
                  width: double.infinity,
                  height: 80.h,
                  fit: BoxFit.fill,

                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.image_not_supported,
                      ),
                    );
                  },
                ),
              ),
            ),

            15.verticalSpace,

            Text(
              categories.name ?? '',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: ColorManager.black,
              ),
            ),

            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}