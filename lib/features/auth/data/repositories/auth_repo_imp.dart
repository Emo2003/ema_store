import 'package:dio/dio.dart';
import 'package:ema_store/features/auth/data/data_sources/auth_data_source.dart';
import 'package:ema_store/features/auth/data/models/Auth_response.dart';
import 'package:ema_store/features/auth/data/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_handling/failure.dart';
import '../../../../core/services/storage_service.dart';

@Injectable(as: AuthRepo)
class AuthRepoImp implements AuthRepo {
  AuthDataSource dataSource;

  AuthRepoImp(this.dataSource);

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      var res = await dataSource.login(email: email, password: password);
      AuthResponse data = AuthResponse.fromJson(res.data);
      if (data.token != null) {
        await StorageService.saveToken(data.token!);
      }
      return data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    try {
      var res = await dataSource.register(
        email: email,
        password: password,
        name: name,
        rePassword: rePassword,
        phone: phone,
      );
      AuthResponse data = AuthResponse.fromJson(res.data);
      if (data.token != null) {
        await StorageService.saveToken(data.token!);
      }
      return data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }
}
