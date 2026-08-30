import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsItems extends StatelessWidget {
  final List<String> categories;

  const BrandsItems({
    super.key,
    required this.categories,
  });

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
        itemCount: categories.length > 4 ? 4 : categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 70.w,
            height: 70.h,
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
          );
        },
      ),
    );
  }
}