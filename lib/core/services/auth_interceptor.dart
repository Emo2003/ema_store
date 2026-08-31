
import 'package:dio/dio.dart';
import 'package:ema_store/core/services/storage_service.dart';

import '../../main.dart';
import '../routes/app_routes_names.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final token = await StorageService.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers['token'] = token;
    }

    handler.next(options);
  }

  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode == 401 ||
        err.response?.statusCode == 403) {
      final responseData = err.response?.data;

      final message =
      responseData is Map ? responseData['message'] : null;

      if (message == 'Invalid or expired token') {
        await StorageService.clearAll();

        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutesNames.login,
              (route) => false,
        );
      }
    }

    handler.next(err);
  }
}