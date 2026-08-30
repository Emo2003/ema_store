import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/widget/custom_outline_btn.dart';
import 'package:ema_store/features/profile/presentation/widgets/menu_items.dart';
import 'package:ema_store/features/profile/presentation/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth/presentation/manager/auth_cubit.dart';
import '../widgets/simple_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubit>().user;

    return Scaffold(
      backgroundColor: ColorManager.secondary,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: SimpleAppBar(),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            spacing: 5.h,
            children: [
              10.verticalSpace,
              ProfileImage(
                imageUrl:
                    "https://static.vecteezy.com/system/resources/previews/028/569/170/non_2x/single-man-icon-people-icon-user-profile-symbol-person-symbol-businessman-stock-vector.jpg",
              ),

              10.verticalSpace,
              Text(
                user?.name ?? "User Name",
                style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.black,
                ),
              ),
              30.verticalSpace,
              MenuItems(
                icon: Icons.person_outline_rounded,
                title: "Personal Information",
                onTap: () {},
              ),

              MenuItems(
                icon: Icons.location_on_outlined,
                title: "My Addresses",
                onTap: () {},
              ),

              MenuItems(
                icon: Icons.settings_outlined,
                title: "Settings",
                onTap: () {},
              ),

              MenuItems(
                icon: Icons.help_outline_rounded,
                title: "Help & Support",
                onTap: () {},
              ),

              20.verticalSpace,

              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: CustomOutlineBtn(onPressed: () {}, text: "Logout"),
              ),

              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
