import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool success;

  const OrderStatusBadge({
    super.key,
    required this.icon,
    required this.text,
    required this.success,
  });

  @override
  Widget build(BuildContext context) {
    final color = success
        ? Colors.green.shade700
        : Colors.orange.shade700;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: color.withAlpha(18),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: color.withAlpha(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 17.sp,
            color: color,
          ),

          6.horizontalSpace,

          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11.5.sp,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}