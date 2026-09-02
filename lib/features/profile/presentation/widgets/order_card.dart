import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/features/cart/data/models/order/Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_items.dart';
import 'order_price_row.dart';
import 'order_status_badge.dart';

class OrderCard extends StatelessWidget {
  final Data order;

  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final items = order.cartItems ?? [];

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withAlpha(80),
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          14.verticalSpace,
          _status(),
          18.verticalSpace,
          _items(items),
          16.verticalSpace,
          Divider(
            color: Colors.grey.shade200,
            height: 1,
          ),
          14.verticalSpace,
          _price(),
          14.verticalSpace,
          _payment(),
          10.verticalSpace,
          _address(),
        ],
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Container(
          width: 46.w,
          height: 46.w,
          decoration: BoxDecoration(
            color: ColorManager.secondary,
            borderRadius: BorderRadius.circular(13.r),
          ),
          child: Icon(
            Icons.receipt_long_outlined,
            color: ColorManager.primary,
            size: 23.sp,
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order #${order.id ?? '---'}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.primary,
                ),
              ),
              5.verticalSpace,
              Text(
                order.createdAt ?? '---',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _status() {
    return Row(
      children: [
        Expanded(
          child: OrderStatusBadge(
            icon: order.isDelivered == true
                ? Icons.local_shipping_outlined
                : Icons.inventory_2_outlined,
            text: order.isDelivered == true
                ? 'Delivered'
                : 'Processing',
            success: order.isDelivered == true,
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: OrderStatusBadge(
            icon: order.isPaid == true
                ? Icons.check_circle_outline
                : Icons.payments_outlined,
            text: order.isPaid == true
                ? 'Paid'
                : 'Not Paid',
            success: order.isPaid == true,
          ),
        ),
      ],
    );
  }

  Widget _items(List items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Items',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: ColorManager.black,
              ),
            ),
            Text(
              '${items.length} ${items.length == 1 ? 'item' : 'items'}',
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        10.verticalSpace,
        if (items.isEmpty)
          Text(
            'No items available',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade600,
            ),
          )
        else
          ...items.map(
                (item) => OrderItem(item: item),
          ),
      ],
    );
  }

  Widget _price() {
    return Column(
      children: [
        OrderPriceRow(
          title: 'Tax',
          value: '${order.taxPrice ?? 0}',
        ),
        7.verticalSpace,
        OrderPriceRow(
          title: 'Shipping',
          value: '${order.shippingPrice ?? 0}',
        ),
        12.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: ColorManager.black,
              ),
            ),
            Text(
              '${order.totalOrderPrice ?? 0}',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w800,
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _payment() {
    return _InfoContainer(
      icon: Icons.payment_outlined,
      title: 'Payment',
      value: _paymentMethod(order.paymentMethodType),
    );
  }

  Widget _address() {
    final address = order.shippingAddress;

    final parts = [
      if (address?.details?.isNotEmpty == true) address!.details!,
      if (address?.city?.isNotEmpty == true) address!.city!,
      if (address?.phone?.isNotEmpty == true) address!.phone!,
    ];

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: ColorManager.secondary.withAlpha(100),
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on_outlined,
            color: ColorManager.primary,
            size: 20.sp,
          ),
          8.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping Address',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.black,
                  ),
                ),
                4.verticalSpace,
                Text(
                  parts.isEmpty
                      ? 'No address available'
                      : parts.join(' • '),
                  style: TextStyle(
                    fontSize: 11.sp,
                    height: 1.4,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _paymentMethod(String? method) {
    if (method == null || method.isEmpty) {
      return 'Unknown';
    }

    return method[0].toUpperCase() + method.substring(1);
  }
}

class _InfoContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoContainer({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 11.h,
      ),
      decoration: BoxDecoration(
        color: ColorManager.secondary.withAlpha(100),
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: ColorManager.primary,
            size: 20.sp,
          ),
          8.horizontalSpace,
          Text(
            title,
            style: TextStyle(
              fontSize: 11.5.sp,
              color: Colors.grey.shade600,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: ColorManager.black,
            ),
          ),
        ],
      ),
    );
  }
}