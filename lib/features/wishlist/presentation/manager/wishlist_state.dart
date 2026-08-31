import '../../data/models/WishListProducts.dart';

abstract class WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<Wishlistproducts> wishlistProducts;

  WishlistSuccessState({required this.wishlistProducts});
}

class WishlistErrorState extends WishlistState {
  final String message;

  WishlistErrorState({required this.message});
}

class WishlistRemoveSuccessState extends WishlistState {
  final String message;

  WishlistRemoveSuccessState({required this.message});
}

class WishlistAddErrorState extends WishlistState {
  final String message;

  WishlistAddErrorState({required this.message});
}

class WishlistRemoveErrorState extends WishlistState {
  final String message;
  final String productId;

  WishlistRemoveErrorState({required this.message, required this.productId});
}
