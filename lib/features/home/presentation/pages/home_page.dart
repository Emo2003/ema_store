import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/widget/custom_app_bar.dart';
import 'package:ema_store/features/home/presentation/widget/brands_items.dart';
import 'package:ema_store/features/home/presentation/widget/categories_items.dart';
import 'package:ema_store/features/home/presentation/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cart/presentation/manager/cart_cubit.dart';
import '../../../cart/presentation/manager/cart_state.dart';
import '../../../category/presentation/manager/category_cubit.dart';
import '../../../wishlist/presentation/manager/wishlist_cubit.dart';
import '../manager/home_cubit.dart';
import '../manager/home_state.dart';
import '../widget/products_card.dart';
import '../../../../core/routes/app_routes_names.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onOpenCart;
  final VoidCallback onViewAllCategories;

  const HomePage({
    super.key,
    required this.onViewAllCategories,
    required this.onOpenCart,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();

    final homeCubit = context.read<HomeCubit>();
    final wishlistCubit = context.read<WishlistCubit>();

    homeCubit.getAllCategories();
    homeCubit.getAllBrands();
    homeCubit.getAllProducts();

    wishlistCubit.getWishlist();
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
      child: Text(
        message,
        style: const TextStyle(color: ColorManager.error),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = searchQuery.trim().isNotEmpty;

    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAddedSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? "Product added to cart")),
          );
        }

        if (state is CartAddedError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage ?? "Failed to add product to cart",
              ),
            ),
          );
        }
      },
      child: Scaffold(
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
                    appearCartIcon: false,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });

                      context.read<HomeCubit>().searchProducts(value);
                    },
                    onCartPressed: widget.onOpenCart,
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
                              decoration: TextDecoration.underline,
                              decorationColor: ColorManager.black,
                              decorationThickness: 1.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    BlocBuilder<HomeCubit, HomeState>(
                      buildWhen: (previous, current) {
                        return current is HomeCategoriesLoadingState ||
                            current is HomeCategoriesSuccessState ||
                            current is HomeCategoriesErrorState;
                      },
                      builder: (context, state) {
                        final homeCubit = context.read<HomeCubit>();

                        final categories = homeCubit.categories;

                        if (state is HomeCategoriesLoadingState &&
                            categories.isEmpty) {
                          return _sectionLoader();
                        }

                        if (state is HomeCategoriesErrorState) {
                          return _sectionError(state.message);
                        }

                        if (categories.isEmpty) {
                          return const SizedBox();
                        }

                        return CategoriesItems(
                          categories: categories,
                          onTap: (category) {
                            final categoryCubit = context.read<CategoryCubit>();

                            categoryCubit
                              ..clearSelection()
                              ..selectCategory(category.id!);

                            Navigator.pushNamed(
                              context,
                              AppRoutesNames.products,
                              arguments: widget.onOpenCart,
                            );
                          },
                        );
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
                      ],
                    ),
                    15.verticalSpace,
                    BlocBuilder<HomeCubit, HomeState>(
                      buildWhen: (previous, current) {
                        return current is HomeBrandsLoadingState ||
                            current is HomeBrandsSuccessState ||
                            current is HomeBrandsErrorState;
                      },
                      builder: (context, state) {
                        final homeCubit = context.read<HomeCubit>();

                        final brands = homeCubit.brands;

                        if (state is HomeBrandsLoadingState && brands.isEmpty) {
                          return _sectionLoader();
                        }

                        if (state is HomeBrandsErrorState) {
                          return _sectionError(state.message);
                        }

                        if (brands.isEmpty) {
                          return const SizedBox();
                        }

                        return BrandsItems(
                          brands: brands,
                          onTap: (brand) {
                            final categoryCubit = context.read<CategoryCubit>();

                            categoryCubit
                              ..clearSelection()
                              ..selectBrand(brand.id!);

                            Navigator.pushNamed(
                              context,
                              AppRoutesNames.products,
                              arguments: widget.onOpenCart,
                            );
                          },
                        );
                      },
                    ),
                    20.verticalSpace,
                  ],
                  Text(
                    'Home Appliances',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black,
                    ),
                  ),
                  10.verticalSpace,
                  BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) {
                      return current is HomeProductsLoadingState ||
                          current is HomeProductsSuccessState ||
                          current is HomeProductsErrorState ||
                          current is HomeProductsSearchState;
                    },
                    builder: (context, state) {
                      final homeCubit = context.read<HomeCubit>();

                      final products = isSearching
                          ? homeCubit.searchResults
                          : homeCubit.products;

                      if (state is HomeProductsLoadingState &&
                          products.isEmpty) {
                        return _sectionLoader();
                      }

                      if (state is HomeProductsErrorState) {
                        return _sectionError(state.message);
                      }

                      if (products.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 30.h),
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

                      return ProductsCard(products: products);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
