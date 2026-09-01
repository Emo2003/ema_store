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

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.h),
        child: CustomInsideAppBar(
          title: "Forgot Password",
          showBackButton: true,
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              // Loading
              if (state is AuthForgetPasswordLoading) {
                CustomLoadingDialog.show(context);
              }
              if (state is AuthForgetPasswordSuccess) {
                CustomLoadingDialog.hide(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Reset code sent to your email"),
                    backgroundColor: ColorManager.primary,
                  ),
                );

                Navigator.pushNamed(context, AppRoutesNames.receiveCode);
              }
              if (state is AuthForgetPasswordFailure) {
                CustomLoadingDialog.hide(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },

            builder: (context, state) {
              final cubit = context.read<AuthCubit>();

              return Column(
                children: [
                  50.verticalSpace,
                  Container(
                    width: 90.w,
                    height: 90.w,
                    decoration: BoxDecoration(
                      color: ColorManager.primary.withAlpha(25),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_reset_rounded,
                      size: 50.sp,
                      color: ColorManager.primary,
                    ),
                  ),

                  25.verticalSpace,
                  Text(
                    "Password Recovery",
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black,
                    ),
                  ),

                  10.verticalSpace,

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      "Don't worry! Enter your email address and we'll send you a code to reset your password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.5,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),

                  30.verticalSpace,

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Address",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black,
                      ),
                    ),
                  ),

                  8.verticalSpace,

                  CustomTextField(
                    controller: cubit.emailController,
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                  ),

                  25.verticalSpace,

                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: CustomElevateBtn(
                      onPressed: () {
                        if (cubit.emailController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter your email"),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        cubit.forgetPassword(cubit.emailController.text.trim());
                      },
                      text: "Send Reset Code",
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
