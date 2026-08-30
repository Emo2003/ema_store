import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  const ProfileImage({super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          height: 150.h,
          width: 150.w,
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorManager.primary.withAlpha(120),
              width: 2,
            ),
          ),
          child: ClipOval(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          right: 2.w,
          bottom: 2.h,
          child: Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorManager.secondary,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.edit_rounded,
              color: ColorManager.white,
              size: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
