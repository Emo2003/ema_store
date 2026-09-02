import 'package:dio/dio.dart';
import 'package:ema_store/features/cart/data/data_sources/cart_data_source.dart';
import 'package:ema_store/features/cart/data/models/cart/Cart_model.dart';
import 'package:ema_store/features/cart/data/models/order/Create_order.dart';
import 'package:ema_store/features/cart/data/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_handling/failure.dart';
import '../models/order/Data.dart';

@Injectable(as: CartRepo)
class CartRepoImp implements CartRepo {
  CartDataSource cartDataSource;

  CartRepoImp(this.cartDataSource);

  @override
  Future<CartModel> addToCart(String productId) async {
    try {
      final response = await cartDataSource.addToCart(productId);
      CartModel data = CartModel.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<CartModel> clearCart() async {
    try {
      final response = await cartDataSource.clearCart();
      CartModel data = CartModel.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<CreateOrder> createOrder(
      String cartId,
      Map<String, dynamic> shippingAddress,
      ) async {
    try {
      final response = await cartDataSource.createOrder(
        cartId,
        shippingAddress,
      );
      CreateOrder data = CreateOrder.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<CartModel> getCartItems() async {
    try {
      final response = await cartDataSource.getCartItems();

      CartModel data = CartModel.fromJson(response.data);

      return data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<List<Data>> getOrders(String userId) async {
    try {
      final response = await cartDataSource.getOrders(userId);

      final List<dynamic> data = response.data;

      return data.map((item) => Data.fromJson(item)).toList();
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<CartModel> removeFromCart(String productId) async {
    try {
      final response = await cartDataSource.removeFromCart(productId);
      CartModel data = CartModel.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<CartModel> updateCartItemQuantity(String productId, int count) async {
    try {
      final response = await cartDataSource.updateCartItemQuantity(
        productId,
        count,
      );
      CartModel data = CartModel.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }
}