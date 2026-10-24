import 'package:ema_store/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ema_store/features/payment/data/models/payment_intent_model/Payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';

import '../services/payment_network_service.dart';

@injectable
class StripeService {
  PaymentNetworkService paymentNetworkService = PaymentNetworkService();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final response = await paymentNetworkService.dio.post(
      "payment_intents",
      data: paymentIntentInputModel.toJson(),
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future initPaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Ema Store',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(PaymentIntentInputModel paymentIntentInputModel) async {
    final createPayment = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(createPayment.clientSecret!);
    await displayPaymentSheet();
  }
}
