import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../home/presentation/manager/home_cubit.dart';
import '../../../home/presentation/widget/search_field.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomInsideAppBar(title: 'Products'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        child: Column(
          children: [
            SearchField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });

                context.read<HomeCubit>().searchProducts(value);
              },
            ),
            20.verticalSpace,
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 7.w,
                  childAspectRatio: 0.60,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutesNames.productsDetails);
                    },
                    child: Container(
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
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRijFWnaEROhzhUrzFrTJf7Z6wUtV3m4-Y2BDN4EohOYo7OYmsnjble0Z5v&s=10",
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
                              padding: EdgeInsets.all(10.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Product Name",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: ColorManager.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  6.verticalSpace,
                                  Text(
                                    "Price EGP",
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
                                        " Review ",
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
