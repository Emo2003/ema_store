import 'package:ema_store/features/cart/data/repositories/cart_repo.dart';
import 'package:ema_store/features/cart/presentation/manager/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/cart/Products.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit(this.cartRepo) : super(CartInitialState());

  List<Products> cartItems = [];
  String? cartId;
  Map<String, dynamic>? shippingAddress;
  String? userId;

  Future<void> addToCart(String productId) async {
    emit(CartAddedLoading());

    try {
      final response = await cartRepo.addToCart(productId);

      cartId = response.cartId;
      cartItems = response.data?.products ?? [];

      emit(CartAddedSuccess(message: response.message));
      emit(CartItemsSuccess(cartItems: List.from(cartItems)));
    } catch (e) {
      emit(CartAddedError(errorMessage: e.toString()));
    }
  }

  Future<void> getCartItems() async {
    emit(CartItemsLoading());

    try {
      final response = await cartRepo.getCartItems();

      cartId = response.cartId;
      cartItems = response.data?.products ?? [];

      emit(CartItemsSuccess(cartItems: List.from(cartItems)));
    } catch (e) {
      emit(CartItemsError(errorMessage: e.toString()));
    }
  }

  Future<void> clearCart() async {
    emit(CartClearingLoading());

    try {
      final response = await cartRepo.clearCart();

      cartItems.clear();
      cartId = null;
      shippingAddress = null;

      emit(CartClearingSuccess(message: response.message));
      emit(CartItemsSuccess(cartItems: List.from(cartItems)));
    } catch (e) {
      emit(CartClearingError(errorMessage: e.toString()));
    }
  }

  Future<void> removeFromCart(String productId) async {
    final index = cartItems.indexWhere((item) => item.product?.id == productId);

    if (index == -1) return;

    final removedItem = cartItems[index];

    cartItems.removeAt(index);

    emit(CartItemsSuccess(cartItems: List.from(cartItems)));

    try {
      final response = await cartRepo.removeFromCart(productId);

      emit(CartRemovingSuccess(message: response.message));
    } catch (e) {
      cartItems.insert(index, removedItem);

      emit(CartItemsSuccess(cartItems: List.from(cartItems)));

      emit(CartRemovingError(errorMessage: e.toString()));
    }
  }

  Future<void> updateCartItemQuantity(String productId, int count) async {
    final index = cartItems.indexWhere((item) => item.product?.id == productId);

    if (index == -1) return;

    final oldCount = cartItems[index].count;

    cartItems[index].count = count;

    emit(CartItemsSuccess(cartItems: List.from(cartItems)));

    try {
      await cartRepo.updateCartItemQuantity(productId, count);
    } catch (e) {
      cartItems[index].count = oldCount;

      emit(CartItemsSuccess(cartItems: List.from(cartItems)));

      emit(CartUpdatingError(errorMessage: e.toString()));
    }
  }

  Future<void> createOrder(
    String cartId,
    Map<String, dynamic> shippingAddress,
  ) async {
    emit(OrderCreatingLoading());

    try {
      final response = await cartRepo.createOrder(cartId, shippingAddress);
      userId = response.user?.id;
      emit(OrderCreatingSuccess(message: response.message));
    } catch (e) {
      emit(OrderCreatingError(errorMessage: e.toString()));
    }
  }

  Future<void> getOrders() async {
    emit(OrdersLoading());

    try {
      final orders = await cartRepo.getOrders(userId!);

      emit(OrdersSuccess(orders: orders));
    } catch (e) {
      emit(OrdersError(errorMessage: e.toString()));
    }
  }
}
