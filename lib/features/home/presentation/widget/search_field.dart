import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onCartPressed;
  final bool appearCartIcon;

  const SearchField({
    super.key,
    required this.onChanged,
    required this.onCartPressed,
    this.appearCartIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            onChanged: onChanged,
            cursorColor: ColorManager.primary,
            decoration: InputDecoration(
              hintText: 'What do you Search for?',
              hintStyle: TextStyle(
                color: ColorManager.primary,
                fontSize: 16.sp,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: ColorManager.primary,
                size: 30.sp,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: BorderSide(
                  color: ColorManager.primary,
                  width: 1.5.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: BorderSide(
                  color: ColorManager.primary,
                  width: 1.5.w,
                ),
              ),
              filled: true,
              fillColor: ColorManager.secondary,
            ),
          ),
        ),

        15.horizontalSpace,

        appearCartIcon?
        IconButton(
          onPressed: onCartPressed,
          icon: SvgPicture.asset(
            IconsAssets.cart,
            colorFilter: ColorFilter.mode(
              ColorManager.primary,
              BlendMode.srcIn,
            ),
            width: 30.w,
            height: 30.h,
          ),
        ): SizedBox.shrink(),
      ],
    );
  }
}