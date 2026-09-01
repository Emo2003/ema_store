import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/widget/custom_loading.dart';
import 'package:ema_store/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/presentation/manager/auth_cubit.dart';
import '../manager/profile_cubit.dart';
import '../manager/profile_state.dart';

class UpdateProfileBottomSheet extends StatefulWidget {
  const UpdateProfileBottomSheet({super.key});

  @override
  State<UpdateProfileBottomSheet> createState() =>
      _UpdateProfileBottomSheetState();
}

class _UpdateProfileBottomSheetState extends State<UpdateProfileBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final user = context.read<AuthCubit>().user;
    final cubit = context.read<ProfileCubit>();

    cubit.setUserData(name: user?.name ?? '', email: user?.email ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: ColorManager.secondary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileUpdateLoadingState) {
                CustomLoadingDialog.show(context);
              }
              if (state is ProfileUpdateSuccessState) {
                CustomLoadingDialog.hide(context);
                context.read<AuthCubit>().updateUser(state.user);
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: ColorManager.primary,
                    content: Text(
                      'Profile updated successfully!',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                );
              }
              if (state is ProfileUpdateErrorState) {
                CustomLoadingDialog.hide(context);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      'Failed to update profile: ${state.message}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              final cubit = context.read<ProfileCubit>();

              return Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHandle(),

                    20.verticalSpace,

                    Text(
                      'Update Profile',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black,
                      ),
                    ),

                    6.verticalSpace,

                    Text(
                      'Update your personal information',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    25.verticalSpace,

                    CustomTextField(
                      controller: cubit.userNameController,
                      hintText: 'Enter your name',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your name';
                        }

                        if (value.trim().length < 3) {
                          return 'Name must be at least 3 characters';
                        }

                        return null;
                      },
                    ),

                    15.verticalSpace,

                    CustomTextField(
                      controller: cubit.userEmailController,
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }

                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }

                        return null;
                      },
                    ),

                    15.verticalSpace,

                    CustomTextField(
                      controller: cubit.userPhoneController,
                      hintText: 'Enter your phone',
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your phone number';
                        }

                        return null;
                      },
                    ),

                    25.verticalSpace,

                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          cubit.updateProfile(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.black,
                          foregroundColor: ColorManager.white,
                          disabledBackgroundColor: Colors.grey.shade400,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        width: 45.w,
        height: 5.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
