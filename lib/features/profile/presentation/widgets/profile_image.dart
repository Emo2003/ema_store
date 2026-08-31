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
    return  Container(
      height: 70.h,
      width: 80.w,
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorManager.primary.withAlpha(120),
          width: 1.7.h,
        ),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
