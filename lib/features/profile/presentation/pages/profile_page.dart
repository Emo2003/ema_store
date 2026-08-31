import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_outline_btn.dart';
import 'package:ema_store/features/profile/presentation/widgets/menu_items.dart';
import 'package:ema_store/features/profile/presentation/widgets/profile_image.dart';
import 'package:ema_store/features/profile/presentation/widgets/update_profile_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/presentation/manager/auth_cubit.dart';
import '../../../auth/presentation/manager/auth_state.dart';
import '../manager/profile_cubit.dart';
import '../widgets/simple_app_bar.dart';
import 'address.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,

      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: SimpleAppBar(),
      ),

      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final user = context.read<AuthCubit>().user;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10.h,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(18.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(15),
                            blurRadius: 10.r,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProfileImage(
                            imageUrl:
                                "https://cdn.vectorstock.com/i/1000v/07/38/brown-user-solid-icon-vector-42790738.jpg",
                          ),

                          15.horizontalSpace,

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user?.name ?? "User Name",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: ColorManager.primary,
                                  ),
                                ),

                                5.verticalSpace,

                                Text(
                                  user?.email ?? "No email",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: ColorManager.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) {
                                  return BlocProvider.value(
                                    value: context.read<ProfileCubit>(),
                                    child: const UpdateProfileBottomSheet(),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                color: ColorManager.primary.withAlpha(20),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                Icons.edit_outlined,
                                color: ColorManager.primary,
                                size: 23.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    50.verticalSpace,

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Account",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.black,
                        ),
                      ),
                    ),

                    MenuItems(
                      icon: Icons.location_on_outlined,
                      title: "My Addresses",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: context.read<ProfileCubit>(),
                              child: const Address(),
                            ),
                          ),
                        );
                      },
                    ),

                    MenuItems(
                      icon: Icons.shopping_bag_outlined,
                      title: "My Orders",
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

                    25.verticalSpace,

                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: CustomOutlineBtn(
                        onPressed: () async {
                          await context.read<AuthCubit>().logout();

                          if (!context.mounted) return;

                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutesNames.login,
                            (route) => false,
                          );
                        },
                        text: "Logout",
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
