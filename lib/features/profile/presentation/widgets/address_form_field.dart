import 'package:ema_store/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const AddressFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: CustomTextField(
        controller: controller,
        hintText: hintText,
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}