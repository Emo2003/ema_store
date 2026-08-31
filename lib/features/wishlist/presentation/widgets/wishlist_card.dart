import 'package:ema_store/features/wishlist/presentation/widgets/wish_card_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withAlpha(25),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: Image.network(
              "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQEkCTYsfUNBTi5PNI90jqtioGOudeuS8IgzRmDbHeP7SlFau1WBFx50vw12FCwM-Tq1zYJdbfsnawx6ZmGPC5xp5qnX4sHCHs3uVNhoSWLzeYcsfosI2tMfA&usqp=CAc",
              width: 105.w,
              height: 128.h,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return Container(
                  width: 105.w,
                  height: 128.h,
                  color: ColorManager.secondary,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: ColorManager.primary.withAlpha(100),
                  ),
                );
              },
            ),
          ),
          12.horizontalSpace,
          WishCardDetails(onTap: () {}),
        ],
      ),
    );
  }
}
