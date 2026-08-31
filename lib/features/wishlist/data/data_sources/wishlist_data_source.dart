import 'package:dio/dio.dart';

abstract class WishlistDataSource {
  Future<Response> getWishlist();

  Future<Response> addToWishlist(String productId);

  Future<Response> removeFromWishlist(String productId);
}
