import 'package:dartz/dartz.dart';
import 'package:ema_store/core/error_handling/failure.dart';

import '../models/payment_intent_input_model.dart';

abstract class PaymentRepo {
  Future<Either<Failure, void>> makePayment(
    PaymentIntentInputModel paymentIntentInputModel,
  );
}
