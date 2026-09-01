import 'package:ema_store/features/wishlist/data/repositories/wishlist_repo.dart';
import 'package:ema_store/features/wishlist/presentation/manager/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo wishlistRepo;

  WishlistCubit({required this.wishlistRepo}) : super(WishlistInitialState());

  Future<void> getWishlist() async {
    emit(WishlistLoadingState());

    try {
      final products = await wishlistRepo.getWishlist();

      emit(WishlistSuccessState(wishlistProducts: products));
    } catch (e) {
      emit(WishlistErrorState(message: e.toString()));
    }
  }

  bool isInWishlist(String productId) {
    if (state is WishlistSuccessState) {
      final products = (state as WishlistSuccessState).wishlistProducts;

      return products.any((product) => product.id == productId);
    }

    return false;
  }

  Future<void> addToWishlist(String productId) async {
    try {
      await wishlistRepo.addToWishlist(productId);
      await getWishlist();
    } catch (e) {
      emit(WishlistAddErrorState(message: e.toString()));
    }
  }

  Future<void> removeFromWishlist(String productId) async {
    try {
      await wishlistRepo.removeFromWishlist(productId);
      emit(
        WishlistRemoveSuccessState(
          message: "Product removed from wishlist successfully",
          productId: productId,
        ),
      );
      await getWishlist();
    } catch (e) {
      emit(
        WishlistRemoveErrorState(message: e.toString(), productId: productId),
      );
    }
  }
}
