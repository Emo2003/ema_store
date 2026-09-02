import 'package:ema_store/features/cart/data/models/order/Create_order.dart';

import '../models/cart/Cart_model.dart';
import '../models/order/Data.dart';

abstract class CartRepo {
  Future<CartModel> addToCart(String productId);

  Future<CartModel> removeFromCart(String productId);

  Future<CartModel> updateCartItemQuantity(String productId, int count);

  Future<CartModel> getCartItems();

  Future<CartModel> clearCart();

  Future<CreateOrder> createOrder(
      String cartId,
      Map<String, dynamic> shippingAddress,
      );

  Future<List<Data>> getOrders(String userId);
}