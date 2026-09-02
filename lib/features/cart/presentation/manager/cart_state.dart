import '../../data/models/cart/Products.dart';
import '../../data/models/order/CartItems.dart';

sealed class CartState {}

class CartInitialState extends CartState {}

//add cart item
class CartAddedLoading extends CartState {}

class CartAddedSuccess extends CartState {
  final String? message;

  CartAddedSuccess({required this.message});
}

class CartAddedError extends CartState {
  final String? errorMessage;

  CartAddedError({required this.errorMessage});
}

//get cart items
class CartItemsLoading extends CartState {}

class CartItemsSuccess extends CartState {
  final List<Products> cartItems;

  CartItemsSuccess({required this.cartItems});
}

class CartItemsError extends CartState {
  final String? errorMessage;

  CartItemsError({required this.errorMessage});
}

//clear cart
class CartClearingLoading extends CartState {}

class CartClearingSuccess extends CartState {
  final String? message;

  CartClearingSuccess({required this.message});
}

class CartClearingError extends CartState {
  final String? errorMessage;

  CartClearingError({required this.errorMessage});
}

//remove cart item
class CartRemovingLoading extends CartState {}

class CartRemovingSuccess extends CartState {
  final String? message;

  CartRemovingSuccess({required this.message});
}

class CartRemovingError extends CartState {
  final String? errorMessage;

  CartRemovingError({required this.errorMessage});
}

//update cart item quantity
class CartUpdatingLoading extends CartState {}

class CartUpdatingSuccess extends CartState {
  final String? message;

  CartUpdatingSuccess({required this.message});
}

class CartUpdatingError extends CartState {
  final String? errorMessage;

  CartUpdatingError({required this.errorMessage});
}

//create order
class OrderCreatingLoading extends CartState {}

class OrderCreatingSuccess extends CartState {
  final String? message;

  OrderCreatingSuccess({required this.message});
}

class OrderCreatingError extends CartState {
  final String? errorMessage;

  OrderCreatingError({required this.errorMessage});
}

//get orders
class OrdersLoading extends CartState {}

class OrdersSuccess extends CartState {
  final List<CartItems> orders;

  OrdersSuccess({required this.orders});
}

class OrdersError extends CartState {
  final String? errorMessage;

  OrdersError({required this.errorMessage});
}
