import 'package:dio/dio.dart';
import 'package:ema_store/core/services/network_service.dart';
import 'package:ema_store/features/auth/data/data_sources/auth_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImp implements AuthDataSource {
  NetworkService networkService;

  AuthDataSourceImp(this.networkService);

  @override
  Future<Response<dynamic>> login({
    required String email,
    required String password,
  }) {
    return networkService.dio.post(
      "v1/auth/signin",
      data: {"email": email, "password": password},
    );
  }

  @override
  Future<Response<dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) {
    return networkService.dio.post(
      "v1/auth/signup",
      data: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
      },
    );
  }

  @override
  Future<Response<dynamic>> forgetPassword({required String email}) {
    return networkService.dio.post(
      "v1/auth/forgotPasswords",
      data: {"email": email},
    );
  }

  @override
  Future<Response<dynamic>> resetPassword({
    required String email,
    required String newPassword,
    required String rePassword,
  }) {
    return networkService.dio.put(
      "v1/auth/resetPassword",
      data: {
        "email": email,
        "newPassword": newPassword,
        "rePassword": rePassword,
      },
    );
  }

  @override
  Future<Response<dynamic>> verifyCode({required String code}) {
    return networkService.dio.post(
      "v1/auth/verifyResetCode",
      data: {"resetCode": code},
    );
  }
}
