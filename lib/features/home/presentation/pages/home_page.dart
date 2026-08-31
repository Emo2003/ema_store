import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/widget/custom_app_bar.dart';
import 'package:ema_store/features/home/presentation/widget/brands_items.dart';
import 'package:ema_store/features/home/presentation/widget/categories_items.dart';
import 'package:ema_store/features/home/presentation/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/home_cubit.dart';
import '../manager/home_state.dart';
import '../widget/home_appliance_item.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onViewAllCategories;

  const HomePage({
    super.key,
    required this.onViewAllCategories,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<HomeCubit>();

      cubit.getAllCategories();
      cubit.getAllBrands();
      cubit.getAllProducts();
    });
  }

  Widget _sectionLoader() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: CircularProgressIndicator(color: ColorManager.primary),
      ),
    );
  }

  Widget _sectionError(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(message, style: const TextStyle(color: Colors.red)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = searchQuery.trim().isNotEmpty;

    return Scaffold(
      backgroundColor: ColorManager.secondary,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });

                    context.read<HomeCubit>().searchProducts(value);
                  },
                ),

                30.verticalSpace,

                if (!isSearching) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      TextButton(
                        onPressed: widget.onViewAllCategories,
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            decorationColor: ColorManager.black,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.7,
                          ),
                        ),
                      ),
                    ],
                  ),

                  15.verticalSpace,

                  BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) {
                      return current is HomeCategoriesSuccessState ||
                          current is HomeCategoriesErrorState ||
                          current is HomeCategoriesLoadingState;
                    },
                    builder: (context, state) {
                      if (state is HomeCategoriesLoadingState) {
                        return _sectionLoader();
                      }

                      if (state is HomeCategoriesErrorState) {
                        return _sectionError(state.message);
                      }

                      final cubit = context.read<HomeCubit>();

                      return CategoriesItems(categories: cubit.categories);
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Brands',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            decorationColor: ColorManager.black,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.7,
                          ),
                        ),
                      ),
                    ],
                  ),

                  15.verticalSpace,

                  BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) {
                      return current is HomeBrandsSuccessState ||
                          current is HomeBrandsErrorState ||
                          current is HomeBrandsLoadingState;
                    },
                    builder: (context, state) {
                      if (state is HomeBrandsLoadingState) {
                        return _sectionLoader();
                      }

                      if (state is HomeBrandsErrorState) {
                        return _sectionError(state.message);
                      }

                      final cubit = context.read<HomeCubit>();

                      return BrandsItems(brands: cubit.brands);
                    },
                  ),

                  20.verticalSpace,
                ],

                Text(
                  "Home Appliances",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.black,
                  ),
                ),

                10.verticalSpace,

                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) {
                    return current is HomeProductsSuccessState ||
                        current is HomeProductsErrorState ||
                        current is HomeProductsLoadingState ||
                        current is HomeProductsSearchState;
                  },
                  builder: (context, state) {
                    if (state is HomeProductsLoadingState) {
                      return _sectionLoader();
                    }

                    if (state is HomeProductsErrorState) {
                      return _sectionError(state.message);
                    }

                    final cubit = context.read<HomeCubit>();

                    final products = isSearching
                        ? cubit.searchResults
                        : cubit.products;

                    if (products.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            'No products found',
                            style: TextStyle(
                              color: ColorManager.error,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    return HomeApplianceItem(products: products);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
