import 'package:ema_store/features/cart/data/repositories/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit(this.cartRepo) : super(CartInitialState());

  CartCubit get(context) => BlocProvider.of<CartCubit>(context);

  Future<void> addToCart(String productId) async {
    emit(CartAddedLoading());

    try {
      final response = await cartRepo.addToCart(productId);

      emit(CartAddedSuccess(message: response.message));
    } catch (e) {
      emit(CartAddedError(errorMessage: e.toString()));
    }
  }

  Future<void> getCartItems() async {
    emit(CartItemsLoading());

    try {
      final response = await cartRepo.getCartItems();

      emit(CartItemsSuccess(cartItems: response));
    } catch (e) {
      emit(CartItemsError(errorMessage: e.toString()));
    }
  }

  Future<void> clearCart() async {
    emit(CartClearingLoading());

    try {
      final response = await cartRepo.clearCart();

      emit(CartClearingSuccess(message: response.message));
    } catch (e) {
      emit(CartClearingError(errorMessage: e.toString()));
    }
  }

  Future<void> removeFromCart(String productId) async {
    emit(CartRemovingLoading());

    try {
      final response = await cartRepo.removeFromCart(productId);

      emit(CartRemovingSuccess(message: response.message));
    } catch (e) {
      emit(CartRemovingError(errorMessage: e.toString()));
    }
  }

  Future<void> updateCartItemQuantity(String productId, int count) async {
    emit(CartUpdatingLoading());

    try {
      final response = await cartRepo.updateCartItemQuantity(productId, count);

      emit(CartUpdatingSuccess(message: response.message));
    } catch (e) {
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

      emit(OrderCreatingSuccess(message: response.message));
    } catch (e) {
      emit(OrderCreatingError(errorMessage: e.toString()));
    }
  }

  Future<void> getOrders(String userId) async {
    emit(OrdersLoading());

    try {
      final response = await cartRepo.getOrders(userId);

      emit(OrdersSuccess(orders: response));
    } catch (e) {
      emit(OrdersError(errorMessage: e.toString()));
    }
  }
}
