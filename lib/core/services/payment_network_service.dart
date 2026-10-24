
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentNetworkService {
  late final Dio dio;

  PaymentNetworkService() {
    final secretKey = dotenv.env['SECRET_KEY'];

    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.stripe.com/v1/',
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 50),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $secretKey',

        },
      ),
    );
  }
}
