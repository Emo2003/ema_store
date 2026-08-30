import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class CategoriesItems extends StatelessWidget {
  final List<String> categories;

  const CategoriesItems({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => 10.horizontalSpace,
        itemCount: categories.length > 4 ? 4 : categories.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: Image.asset(
                      categories[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                5.verticalSpace,

                Text(
                  "Fashion",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorManager.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}