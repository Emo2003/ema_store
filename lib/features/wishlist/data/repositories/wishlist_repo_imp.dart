import 'package:ema_store/features/wishlist/data/data_sources/wishlist_data_source.dart';
import 'package:ema_store/features/wishlist/data/repositories/wishlist_repo.dart';
import 'package:injectable/injectable.dart';

import '../models/WishListProducts.dart';

@Injectable(as: WishlistRepo)
class WishlistRepoImp implements WishlistRepo {
  final WishlistDataSource wishlistDataSource;

  WishlistRepoImp({required this.wishlistDataSource});

  List<Wishlistproducts> _parseProducts(dynamic responseData) {
    if (responseData is! List) {
      throw Exception('Unexpected wishlist response format');
    }
    return responseData
        .map((item) => Wishlistproducts.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<Wishlistproducts>> getWishlist() async {
    try {
      final response = await wishlistDataSource.getWishlist();
      if (response.statusCode == 200) {
        return _parseProducts(response.data['data']);
      }
      throw Exception('Failed to fetch wishlist');
    } catch (e) {
      throw Exception('Error fetching wishlist: $e');
    }
  }

  @override
  Future<void> addToWishlist(String productId) async {
    try {
      final response = await wishlistDataSource.addToWishlist(productId);
      if (response.statusCode == 200) {
        return;
      }
      throw Exception('Failed to add product to wishlist');
    } catch (e) {
      throw Exception('Error adding product to wishlist: $e');
    }
  }

  @override
  Future<void> removeFromWishlist(String productId) async {
    try {
      final response = await wishlistDataSource.removeFromWishlist(productId);
      if (response.statusCode == 200) {
        return;
      }
      throw Exception('Failed to remove product from wishlist');
    } catch (e) {
      throw Exception('Error removing product from wishlist: $e');
    }
  }
}