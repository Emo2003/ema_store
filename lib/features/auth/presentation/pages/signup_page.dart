import 'package:ema_store/core/resources/assets_manager.dart';
import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/routes/app_routes_names.dart';
import 'package:ema_store/core/widget/custom_text_field.dart';
import 'package:ema_store/core/widget/validator.dart';
import 'package:ema_store/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ema_store/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/custom_loading.dart';
import '../../../../core/widget/custom_success_dialog.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) async {

              if (state is AuthLoading) {
                CustomLoadingDialog.show(context);
              }

              else if (state is AuthSuccess) {

                CustomLoadingDialog.hide(context);
                await CustomSuccessDialog.show(
                  context: context,
                  title: 'Account Created!',
                  message:
                  'Your account has been created successfully.',
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
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [
                      Center(
                        child: Image.asset(
                          ImageAssets.logo,
                          width: 230.w,
                          height: 230.h,
                        ),
                      ),

                      17.verticalSpace,

                      CustomTextField(
                        hintText: "Full Name",
                        controller: cubit.nameController,
                        validator: Validators.nameValidator,
                      ),

                      17.verticalSpace,
                      CustomTextField(
                        hintText: "Phone Number",
                        controller: cubit.phoneController,
                        keyboardType: TextInputType.phone,
                        validator: Validators.validatePhone,
                      ),

                      17.verticalSpace,

                      CustomTextField(
                        hintText: "Email",
                        controller: cubit.emailController,
                        keyboardType:
                        TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                      ),

                      17.verticalSpace,

                      CustomTextField(
                        hintText: "Password",
                        controller: cubit.passwordController,
                        obscureText: true,
                        validator:
                        Validators.validatePassword,
                      ),

                      17.verticalSpace,


                      CustomTextField(
                        hintText: "Confirm Password",
                        controller:
                        cubit.confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          return Validators
                              .validateConfirmPassword(
                            value,
                            cubit.passwordController.text,
                          );
                        },
                      ),

                      20.verticalSpace,

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          ColorManager.primary,
                          minimumSize: Size(
                            350.w,
                            50.h,
                          ),
                        ),

                        onPressed: state is AuthLoading
                            ? null
                            : () {
                          if (_formKey
                              .currentState!
                              .validate()) {
                            cubit.register();
                          }
                        },

                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.white,
                          ),
                        ),
                      ),

                      10.verticalSpace,

                      // Login

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                              color: ColorManager.primary,
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator
                                  .pushReplacementNamed(
                                context,
                                AppRoutesNames.login,
                              );
                            },

                            child: Text(
                              "Login",
                              style: TextStyle(
                                color:
                                ColorManager.primary,
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