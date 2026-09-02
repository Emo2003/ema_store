import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:ema_store/core/widget/custom_loading.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_cubit.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_state.dart';
import 'package:ema_store/features/category/presentation/manager/category_cubit.dart';
import 'package:ema_store/features/category/presentation/manager/category_state.dart';
import 'package:ema_store/features/home/presentation/widget/products_card.dart';
import 'package:ema_store/features/home/presentation/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsPage extends StatefulWidget {
  final VoidCallback onOpenCart;

  const ProductsPage({super.key, required this.onOpenCart});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String searchQuery = '';

  void openCart() {
    Navigator.pop(context);
    widget.onOpenCart();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final cubit = context.read<CategoryCubit>();

      if (cubit.selectedCategoryId != null) {
        cubit.getProductsByCategory();
      } else if (cubit.selectedBrandId != null) {
        cubit.getProductsByBrand();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomInsideAppBar(title: 'Products'),
      ),
      body: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartAddedSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message ?? "Product added to cart successfully",
                ),
                backgroundColor: ColorManager.primary,
              ),
            );
          }

          if (state is CartAddedError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? "Failed to add product to cart",
                ),
                backgroundColor: ColorManager.error,
              ),
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: Column(
            children: [
              SearchField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });

                  context.read<CategoryCubit>().searchProducts(value);
                },
                onCartPressed: openCart,
              ),
              20.verticalSpace,
              Expanded(
                child: BlocConsumer<CategoryCubit, CategoryState>(
                  listener: (context, state) {
                    if (state is CategoryLoadingState ||
                        state is BrandLoadingState) {
                      CustomLoadingDialog.show(context);
                    }

                    if (state is CategorySuccessState ||
                        state is BrandSuccessState ||
                        state is CategorySearchState) {
                      CustomLoadingDialog.hide(context);
                    }

                    if (state is CategoryErrorState ||
                        state is BrandErrorState) {
                      CustomLoadingDialog.hide(context);

                      final message = state is CategoryErrorState
                          ? state.message
                          : (state as BrandErrorState).message;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                          backgroundColor: ColorManager.error,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<CategoryCubit>();

                    if (state is CategoryErrorState ||
                        state is BrandErrorState) {
                      return const Center(child: Text('Something went wrong'));
                    }

                    final isCategorySelected = cubit.selectedCategoryId != null;

                    final products = state is CategorySearchState
                        ? cubit.searchResults
                        : isCategorySelected
                        ? cubit.categoryProducts
                        : cubit.brandProducts;

                    if (products.isEmpty) {
                      if (state is CategoryLoadingState ||
                          state is BrandLoadingState) {
                        return const SizedBox();
                      }

                      return const Center(child: Text('No products found'));
                    }

                    return ProductsCard(
                      isNotLoading: false,
                      products: products,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
