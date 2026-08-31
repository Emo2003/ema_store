import 'package:ema_store/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProductsDetails extends StatefulWidget {
  const ProductsDetails({super.key});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRijFWnaEROhzhUrzFrTJf7Z6wUtV3m4-Y2BDN4EohOYo7OYmsnjble0Z5v&s=10",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300.h,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        "Product Details",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.secondary,
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
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(17.r),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRijFWnaEROhzhUrzFrTJf7Z6wUtV3m4-Y2BDN4EohOYo7OYmsnjble0Z5v&s=10",
                  fit: BoxFit.cover,
                  width: 70.w,
                  height: 70.h,
                ),
              ),
              SizedBox(width: 10.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(17.r),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRijFWnaEROhzhUrzFrTJf7Z6wUtV3m4-Y2BDN4EohOYo7OYmsnjble0Z5v&s=10",
                  fit: BoxFit.cover,
                  width: 70.w,
                  height: 70.h,
                ),
              ),
              SizedBox(width: 10.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(17.r),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRijFWnaEROhzhUrzFrTJf7Z6wUtV3m4-Y2BDN4EohOYo7OYmsnjble0Z5v&s=10",
                  fit: BoxFit.cover,
                  width: 70.w,
                  height: 70.h,
                ),
              ),
              SizedBox(width: 10.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(17.r),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRijFWnaEROhzhUrzFrTJf7Z6wUtV3m4-Y2BDN4EohOYo7OYmsnjble0Z5v&s=10",
                  fit: BoxFit.cover,
                  width: 70.w,
                  height: 70.h,
                ),
              ),
            ],
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Product Name",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.primary,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "EGP 100",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.primary,
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Text(
                      " 4.5 ( 200 reviews )",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.primary,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Icon(Icons.star, color: Colors.orangeAccent, size: 20.sp),
                    Container(
                      width: 50.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            color: ColorManager.secondary,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: ColorManager.primary,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.primary,
                            ),
                          ),
                          Container(
                            width: 1.w,
                            height: 20.h,
                            color: ColorManager.secondary,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                color: ColorManager.primary,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
