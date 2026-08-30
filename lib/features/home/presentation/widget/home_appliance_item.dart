import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class HomeApplianceItem extends StatelessWidget {
  final List<String> categories;

  const HomeApplianceItem({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.75,
      ),

      itemCount: 10,

      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: ColorManager.primary.withAlpha(50)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image + Favorite
              SizedBox(
                height: 120.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(
                          categories[index % categories.length],
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: ColorManager.secondary,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            // Add to favorite
                          },
                          icon: Icon(
                            Icons.favorite_outline_rounded,
                            color: ColorManager.primary,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Name",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: ColorManager.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      5.verticalSpace,

                      Text(
                        "\$99.99",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            " Review (4.5) ",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: ColorManager.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: 15.sp,
                            ),
                          ),
                          5.horizontalSpace,
                          InkWell(
                            onTap: () {
                              // Add to cart
                            },
                            splashColor: Colors.transparent,
                            child: CircleAvatar(
                              radius: 12.r,
                              backgroundColor: ColorManager.primary,
                              child: Icon(
                                Icons.add,
                                size: 23.sp,
                                color: ColorManager.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
