import 'package:dartz/dartz.dart';
import 'package:ema_store/core/error_handling/failure.dart';
import 'package:ema_store/core/utils/stripe_service.dart';
import 'package:ema_store/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ema_store/features/payment/data/repositories/payment_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRepo)
class PaymentRepoImp implements PaymentRepo {
  StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    try {
      await stripeService.makePayment(paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
