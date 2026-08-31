import 'package:ema_store/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/custom_loading.dart';
import '../manager/profile_cubit.dart';
import '../manager/profile_state.dart';
import 'add_address_form.dart';

class AddAddressBottomSheet extends StatelessWidget {
  const AddAddressBottomSheet({super.key});

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
            listener: _handleState,
            builder: (context, state) {
              return AddAddressForm();
            },
          ),
        ),
      ),
    );
  }

  void _handleState(BuildContext context, ProfileState state) {
    final cubit = context.read<ProfileCubit>();
    if (state is ProfileAddLoadingState) {
      CustomLoadingDialog.show(context);
    }

    if (state is ProfileAddSuccessState) {
      CustomLoadingDialog.hide(context);
      cubit.clearAddressControllers();

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.primary,
          content: Text(
            'Address added successfully!',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.white,
            ),
          ),
        ),
      );

      cubit.getAddresses();
    }

    if (state is ProfileAddErrorState) {
      CustomLoadingDialog.hide(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.primary,
          content: Text(
            'Failed to add address: ${state.message}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.white,
            ),
          ),
        ),
      );
    }
  }
}
