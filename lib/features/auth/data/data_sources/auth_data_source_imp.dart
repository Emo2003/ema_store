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
}
