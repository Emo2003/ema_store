import 'package:ema_store/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ema_store/features/payment/data/repositories/payment_repo.dart';
import 'package:ema_store/features/payment/presentation/manager/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  PaymentRepo paymentRepo;

  PaymentCubit(this.paymentRepo) : super(PaymentInitial());

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());
    final result = await paymentRepo.makePayment(paymentIntentInputModel);
    result.fold(
      (failure) => emit(PaymentFailure(failure.message)),
      (success) => emit(PaymentSuccess()),
    );
  }
}
