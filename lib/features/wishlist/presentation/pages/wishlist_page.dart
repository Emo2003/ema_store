import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:ema_store/features/wishlist/presentation/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomInsideAppBar(
          title: "Wishlist",
          showBackButton: false,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.w),
        child: ListView.separated(
          itemBuilder: (context, index) => WishlistCard(),
          separatorBuilder: (_, _) => 10.verticalSpace,
          itemCount: 4,
        ),
      ),
    );
  }
}
