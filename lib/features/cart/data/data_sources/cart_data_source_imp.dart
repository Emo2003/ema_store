import 'package:dio/dio.dart';
import 'package:ema_store/features/cart/data/data_sources/cart_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/network_service.dart';

@Injectable(as: CartDataSource)
class CartDataSourceImp implements CartDataSource {
  NetworkService networkService;

  CartDataSourceImp(this.networkService);

  @override
  Future<Response<dynamic>> addToCart(String productId) {
    return networkService.dio.post(
      'v2/cart',
      data: {'productId': productId},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
  }

  @override
  Future<Response<dynamic>> clearCart() {
    return networkService.dio.delete('v2/cart');
  }

  @override
  Future<Response<dynamic>> createOrder(
    String cartId,
    Map<String, dynamic> shippingAddress,
  ) {
    return networkService.dio.post(
      'v2/orders/$cartId',
      data: {'shippingAddress': shippingAddress},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
  }

  @override
  Future<Response<dynamic>> getCartItems() {
    return networkService.dio.get('v2/cart');
  }

  @override
  Future<Response<dynamic>> getOrders(String userId) {
    return networkService.dio.get('v1/orders/user/$userId');
  }

  @override
  Future<Response<dynamic>> removeFromCart(String productId) {
    return networkService.dio.delete('v2/cart/$productId');
  }

  @override
  Future<Response<dynamic>> updateCartItemQuantity(
    String productId,
    int count,
  ) {
    return networkService.dio.put(
      'v2/cart/$productId',
      data: {'count': count},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
  }
}
