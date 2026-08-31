import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/widget/custom_app_bar.dart';
import 'package:ema_store/core/widget/custom_loading.dart';
import 'package:ema_store/features/category/presentation/widgets/categories_container.dart';
import 'package:ema_store/features/home/presentation/manager/home_cubit.dart';
import 'package:ema_store/features/home/presentation/manager/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      appBar: CustomAppBar(),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeCategoriesLoadingState) {
            CustomLoadingDialog.show(context);
          }
          if (state is HomeCategoriesSuccessState) {
            CustomLoadingDialog.hide(context);
          }
          if (state is HomeCategoriesErrorState) {
            CustomLoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ColorManager.error,
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          final categories = cubit.categories;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All Categories',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary,
                  ),
                ),
                20.verticalSpace,
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 15.0,
                        ),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return CategoriesContainer(categories: category);
                    },
                    itemCount: categories.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
