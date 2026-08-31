import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/models/products/Products.dart';
import 'full_screen_image_viewer.dart';

class ProductSmallImages extends StatelessWidget {
  final Products product;
  const ProductSmallImages({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemBuilder: (context, index) {
          List<String> images = product.images ?? [];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenImageViewer(
                    images: images,
                    initialIndex: index,
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
                width: 70.w,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 70.w,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => 15.horizontalSpace,
        itemCount: product.images?.length ?? 0,
      ),
    );
  }
}
