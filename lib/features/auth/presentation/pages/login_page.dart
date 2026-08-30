import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_elevate_btn.dart';
import 'package:ema_store/core/widget/custom_text_field.dart';
import 'package:ema_store/core/widget/validator.dart';
import 'package:ema_store/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ema_store/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/custom_loading.dart';
import '../../../../core/widget/custom_success_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) async {

              if (state is AuthLoading) {
                CustomLoadingDialog.show(context);
              }

              else if (state is AuthSuccess) {

                CustomLoadingDialog.hide(context);

                await CustomSuccessDialog.show(
                  context: context,
                  title: 'Welcome Back!',
                  message: 'You have logged in successfully.',
                );

                if (!context.mounted) return;

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutesNames.layout,
                      (route) => false,
                );
              }

              else if (state is AuthFailure) {

                CustomLoadingDialog.hide(context);

                if (!context.mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              }
            },

            builder: (context, state) {
              final cubit = AuthCubit.get(context);

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),

                child: Form(
                  key: _formKey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.h,

                    children: [

                      Center(
                        child: Image.asset(
                          ImageAssets.logo,
                          width: 230.w,
                          height: 230.h,
                        ),
                      ),
                      Text(
                        "Welcome Back to EMAStore",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 27.sp,
                          color: ColorManager.primary,
                        ),
                      ),

                      Text(
                        "Please sign in with your Email",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: ColorManager.primary,
                        ),
                      ),

                      10.verticalSpace,
                      CustomTextField(
                        hintText: "Email",
                        controller: cubit.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                      ),

                      CustomTextField(
                        hintText: "Password",
                        controller: cubit.passwordController,
                        obscureText: true,
                        validator: Validators.validateLoginPassword,
                      ),
                      Align(
                        alignment: Alignment.centerRight,

                        child: TextButton(
                          onPressed: () {},

                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: 16.sp,
                              decoration: TextDecoration.underline,
                              decorationColor: ColorManager.primary,
                            ),
                          ),
                        ),
                      ),

                      CustomElevateBtn(
                        text: "Login",
                        onPressed: state is AuthLoading
                            ? null
                            : () {
                          if (_formKey.currentState!
                              .validate()) {
                            cubit.login();
                          }
                        },
                      ),

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [
                          Text(
                            "Don’t have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                              color: ColorManager.primary,
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutesNames.register,
                              );
                            },

                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: 17.sp,
                                decoration:
                                TextDecoration.underline,
                                decorationColor:
                                ColorManager.primary,
                                decorationThickness: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}