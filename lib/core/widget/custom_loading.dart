import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomLoadingDialog {
  static bool _isShowing = false;

  static void show(BuildContext context) {
    if (_isShowing) return;
    _isShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) {
        return const Center(
          child: CircularProgressIndicator(
            color: ColorManager.primary,
          ),
        );
      },
    ).then((_) {
      _isShowing = false;
    });
  }

  static void hide(BuildContext context) {
    if (!_isShowing) return;
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      _isShowing = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}