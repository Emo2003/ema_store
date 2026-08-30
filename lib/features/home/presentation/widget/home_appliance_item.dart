import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../data/models/products/Products.dart';

class HomeApplianceItem extends StatelessWidget {
  final List<Products> products;

  const HomeApplianceItem({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.60,
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        final hasDiscount =
            product.priceAfterDiscount != null &&
            product.priceAfterDiscount! > 0 &&
            product.priceAfterDiscount! < (product.price ?? 0);

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(
              color: ColorManager.primary.withAlpha(100),
              width: 1.2.w,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 170.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.network(
                          product.imageCover ?? "",
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.image_not_supported),
                            );
                          },
                        ),
                      ),
                    ),

                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: ColorManager.primary.withAlpha(100),
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
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: ColorManager.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      6.verticalSpace,

                      if (hasDiscount)
                        Row(
                          children: [
                            Text(
                              "${product.priceAfterDiscount} EGP",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: ColorManager.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            15.horizontalSpace,
                            Flexible(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    "${product.price} EGP",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorManager.primary.withAlpha(
                                        140,
                                      ),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    height: 1.h,
                                    width: 55.w,
                                    color: ColorManager.primary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      else
                        Text(
                          "${product.price ?? ""} EGP",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorManager.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            " Review ( ${product.ratingsAverage ?? ""} )",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: ColorManager.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          7.horizontalSpace,
                          Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                            size: 16.sp,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              // Add to cart
                            },
                            borderRadius: BorderRadius.circular(20.r),
                            splashColor: Colors.transparent,
                            child: CircleAvatar(
                              radius: 12.r,
                              backgroundColor: ColorManager.primary,
                              child: Icon(
                                Icons.add,
                                size: 20.sp,
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
