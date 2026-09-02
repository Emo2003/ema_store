import 'dart:async';

import 'package:dio/dio.dart';

abstract class CartDataSource {
  Future<Response> addToCart(String productId);

  Future<Response> removeFromCart(String productId);

  Future<Response> updateCartItemQuantity(String productId, int count);

  Future<Response> getCartItems();

  Future<Response> clearCart();

  Future<Response> createOrder(
    String cartId,
    Map<String, dynamic> shippingAddress,
  );

  Future<Response> getOrders(String userId);
}
