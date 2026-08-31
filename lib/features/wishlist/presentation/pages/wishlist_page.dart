import 'package:ema_store/core/resources/color_manager.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:ema_store/core/widget/custom_loading.dart';
import 'package:ema_store/features/wishlist/presentation/manager/wishlist_cubit.dart';
import 'package:ema_store/features/wishlist/presentation/manager/wishlist_state.dart';
import 'package:ema_store/features/wishlist/presentation/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WishlistCubit>().getWishlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomInsideAppBar(title: "Wishlist", showBackButton: false),
      ),

      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: BlocConsumer<WishlistCubit, WishlistState>(
          listener: (context, state) {
            if (state is WishlistLoadingState) {
              CustomLoadingDialog.show(context);
            } else {
              CustomLoadingDialog.hide(context);
            }

            if (state is WishlistRemoveSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: ColorManager.primary,
                  content: Text(
                    "Product removed from wishlist successfully",
                    style: TextStyle(color: ColorManager.white),
                  ),
                ),
              );
            }

            if (state is WishlistErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }

            if (state is WishlistRemoveErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },

          builder: (context, state) {
            if (state is WishlistLoadingState) {
              return const SizedBox();
            }

            if (state is WishlistSuccessState) {
              final products = state.wishlistProducts;

              if (products.isEmpty) {
                return const Center(child: Text("Your wishlist is empty"));
              }

              return ListView.separated(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return WishlistCard(wishlistProducts: products[index]);
                },
                separatorBuilder: (_, _) => 10.verticalSpace,
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
