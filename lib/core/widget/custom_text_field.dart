import 'package:ema_store/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,

      // Actual input text style
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.primary,
      ),

      // Password visibility
      obscureText: _isObscure,

      validator: widget.validator,

      cursorColor: ColorManager.primary,

      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.white,

        hintText: widget.hintText,

        hintStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: ColorManager.primary,
        ),

        // Show eye only for password fields
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _isObscure
                ? Icons.visibility_off
                : Icons.visibility,
            color: ColorManager.primary,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        )
            : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(
            color: ColorManager.primary,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}