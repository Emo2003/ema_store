import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_elevate_btn.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:ema_store/core/widget/custom_loading.dart';
import 'package:ema_store/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/auth_cubit.dart';
import '../manager/auth_state.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Scaffold(
      backgroundColor: ColorManager.secondary,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.h),
        child: CustomInsideAppBar(
          title: "Reset Password",
          showBackButton: false,
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthResetPasswordValidationFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: ColorManager.error,
                  ),
                );
              }

              if (state is AuthResetPasswordLoading) {
                CustomLoadingDialog.show(context);
              }

              if (state is AuthResetPasswordSuccess) {
                CustomLoadingDialog.hide(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Password reset successfully"),
                    backgroundColor: ColorManager.primary,
                  ),
                );

                Navigator.pushReplacementNamed(context, AppRoutesNames.login);
              }

              if (state is AuthResetPasswordFailure) {
                CustomLoadingDialog.hide(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: ColorManager.error,
                  ),
                );
              }
            },
            builder: (context, state) {
              final isLoading = state is AuthResetPasswordLoading;

              return Column(
                children: [
                  45.verticalSpace,
                  Container(
                    width: 90.w,
                    height: 90.w,
                    decoration: BoxDecoration(
                      color: ColorManager.primary.withAlpha(25),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_reset_rounded,
                      size: 48.sp,
                      color: ColorManager.primary,
                    ),
                  ),

                  25.verticalSpace,

                  Text(
                    "Create New Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black,
                    ),
                  ),

                  10.verticalSpace,
                  Text(
                    "Create a new password for your account. Make sure it's strong and easy to remember.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.5,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  30.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "New Password",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black,
                      ),
                    ),
                  ),

                  8.verticalSpace,

                  CustomTextField(
                    controller: cubit.newPasswordController,
                    hintText: "Enter new password",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),

                  20.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black,
                      ),
                    ),
                  ),

                  8.verticalSpace,

                  CustomTextField(
                    controller: cubit.rePasswordController,
                    hintText: "Confirm your new password",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),

                  30.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: CustomElevateBtn(
                      onPressed: isLoading
                          ? null
                          : () => context.read<AuthCubit>().resetPassword(),
                      text: "Reset Password",
                    ),
                  ),

                  20.verticalSpace,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
