import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_elevate_btn.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/custom_loading.dart';
import '../manager/auth_cubit.dart';
import '../manager/auth_state.dart';
import '../widgets/otp_field.dart';

class ReceiveCodePage extends StatefulWidget {
  const ReceiveCodePage({super.key});

  @override
  State<ReceiveCodePage> createState() => _ReceiveCodePageState();
}

class _ReceiveCodePageState extends State<ReceiveCodePage> {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (final controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String get otpCode {
    return otpControllers.map((controller) => controller.text).join();
  }

  void verifyCode() {
    final code = otpCode;

    if (code.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter the complete verification code"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.read<AuthCubit>().verifyCode(code);
  }

  void resendCode() {
    final cubit = context.read<AuthCubit>();
    final email = cubit.resetEmail;

    if (email == null || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Missing email address. Please go back and try again."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    cubit.forgetPassword(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.h),
        child: CustomInsideAppBar(
          title: "Verification Code",
          showBackButton: true,
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              // Verify code flow
              if (state is AuthVerifyCodeLoading) {
                CustomLoadingDialog.show(context);
              } else if (state is AuthVerifyCodeSuccess) {
                CustomLoadingDialog.hide(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Code verified successfully"),
                    backgroundColor: ColorManager.primary,
                  ),
                );
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutesNames.resetPassword,
                );
              } else if (state is AuthVerifyCodeFailure) {
                CustomLoadingDialog.hide(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }
              // Resend code flow (reuses forgetPassword)
              else if (state is AuthForgetPasswordLoading) {
                CustomLoadingDialog.show(context);
              } else if (state is AuthForgetPasswordSuccess) {
                CustomLoadingDialog.hide(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("A new code has been sent to your email"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is AuthForgetPasswordFailure) {
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
              final isLoading =
                  state is AuthVerifyCodeLoading ||
                  state is AuthForgetPasswordLoading;

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
                      Icons.mark_email_read_outlined,
                      size: 48.sp,
                      color: ColorManager.primary,
                    ),
                  ),

                  25.verticalSpace,

                  Text(
                    "Check Your Email",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black,
                    ),
                  ),

                  10.verticalSpace,

                  Text(
                    "We've sent a verification code to your email address.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.5,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  8.verticalSpace,

                  Text(
                    "Enter the code below to continue.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  30.verticalSpace,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      6,
                      (index) => OtpField(controller: otpControllers[index]),
                    ),
                  ),

                  30.verticalSpace,

                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: CustomElevateBtn(
                      onPressed: isLoading ? null : verifyCode,
                      text: "Verify Code",
                    ),
                  ),

                  20.verticalSpace,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code? ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),

                      TextButton(
                        onPressed: isLoading ? null : resendCode,
                        child: Text(
                          "Resend",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary,
                          ),
                        ),
                      ),
                    ],
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
