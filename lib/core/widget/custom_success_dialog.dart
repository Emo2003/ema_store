import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CustomSuccessDialog {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          backgroundColor: ColorManager.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 70),
              15.verticalSpace,

              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primary,
                ),
              ),

              15.verticalSpace,
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: ColorManager.primary),
              ),
            ],
          ),
        );
      },
    );

    // Wait before closing the dialog
    await Future.delayed(duration);

    if (context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
