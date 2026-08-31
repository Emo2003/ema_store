import 'package:ema_store/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/Data.dart';

class AddressContainer extends StatelessWidget {
  final Data address;
  final VoidCallback onDelete;

  const AddressContainer({
    super.key,
    required this.address,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  color: ColorManager.primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  color: ColorManager.primary,
                  size: 23.sp,
                ),
              ),

              12.horizontalSpace,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name ?? 'Address',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.black,
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: onDelete,
                borderRadius: BorderRadius.circular(10.r),
                child: Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: BoxDecoration(
                    color: ColorManager.error.withAlpha(15),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    Icons.delete_outline_rounded,
                    color: ColorManager.error,
                    size: 21.sp,
                  ),
                ),
              ),
            ],
          ),

          16.verticalSpace,
          Divider(height: 1, color: ColorManager.primary.withAlpha(100)),
          14.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.home_outlined,
                size: 20.sp,
                color: Colors.grey.shade600,
              ),

              10.horizontalSpace,
              Expanded(
                child: Text(
                  address.details ?? 'No address details',
                  style: TextStyle(
                    fontSize: 14.sp,
                    height: 1.4,
                    color: ColorManager.black,
                  ),
                ),
              ),
            ],
          ),

          12.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.location_city_outlined,
                size: 20.sp,
                color: Colors.grey.shade600,
              ),

              10.horizontalSpace,
              Text(
                address.city ?? 'No city',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
              ),
            ],
          ),

          12.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.phone_outlined,
                size: 20.sp,
                color: Colors.grey.shade600,
              ),
              10.horizontalSpace,

              Text(
                address.phone ?? 'No phone number',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
