import 'package:ema_store/core/resources/assets_manager.dart';
import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/widget/custom_app_bar.dart';
import 'package:ema_store/features/home/presentation/widget/brands_items.dart';
import 'package:ema_store/features/home/presentation/widget/categories_items.dart';
import 'package:ema_store/features/home/presentation/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/home_appliance_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  final List<String> banners = ['Banner 1', 'Banner 2', 'Banner 3'];

  final List<String> categories = [
    ImageAssets.photo,
    ImageAssets.photo,
    ImageAssets.photo,
    ImageAssets.photo,
    ImageAssets.photo,
    ImageAssets.photo,
    ImageAssets.photo,
    ImageAssets.photo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchField(),
                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black,
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        // Navigate to all categories page
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          decorationColor: ColorManager.black,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.7,
                        ),
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                CategoriesItems(categories: categories),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Brands',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black,
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        // Navigate to all categories page
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          decorationColor: ColorManager.black,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.7,
                        ),
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                BrandsItems(categories: categories),
                20.verticalSpace,
                Text(
                  "Home Appliances",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.black,
                  ),
                ),
                10.verticalSpace,
                HomeApplianceItem(categories: categories),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
