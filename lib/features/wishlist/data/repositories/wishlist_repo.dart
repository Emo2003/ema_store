import '../models/WishListProducts.dart';

abstract class WishlistRepo {
  Future<List<Wishlistproducts>> getWishlist();
  Future<void> addToWishlist(String productId);
  Future<void> removeFromWishlist(String productId);
}