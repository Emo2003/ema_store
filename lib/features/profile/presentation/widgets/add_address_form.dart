import 'package:ema_store/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../manager/profile_cubit.dart';
import 'address_form_field.dart';
import 'add_address_button.dart';

class AddAddressForm extends StatefulWidget {

  const AddAddressForm({super.key});

  @override
  State<AddAddressForm> createState() => _AddAddressFormState();
}

class _AddAddressFormState extends State<AddAddressForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            'Add New Address',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.black,
            ),
          ),

          6.verticalSpace,

          Text(
            'Enter your address details',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
          ),

          25.verticalSpace,

          AddressFormField(
            controller: cubit.nameController,
            hintText: 'e.g. Home',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a name for the address';
              }

              return null;
            },
          ),

          AddressFormField(
            controller: cubit.cityController,
            hintText: 'e.g. Cairo',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a city';
              }

              return null;
            },
          ),

          AddressFormField(
            controller: cubit.detailsController,
            hintText: 'Street, building, apartment...',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter address details';
              }

              return null;
            },
          ),

          AddressFormField(
            controller: cubit.phoneController,
            hintText: 'Enter your phone number',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a phone number';
              }

              return null;
            },
          ),

          25.verticalSpace,

          AddAddressButton( onPressed: _submit),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        width: 45.w,
        height: 5.h,
        decoration: BoxDecoration(
          color: ColorManager.primary.withAlpha(100),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ProfileCubit>().addAddress();
    }
  }
}
