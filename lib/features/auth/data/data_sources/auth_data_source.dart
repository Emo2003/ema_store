import 'package:dio/dio.dart';

abstract class AuthDataSource {
  Future<Response> login({required String email, required String password});

  Future<Response> register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });

  Future<Response> forgetPassword({required String email});

  Future<Response> resetPassword({
    required String email,
    required String newPassword,
    required String rePassword,
  });

  Future<Response> verifyCode({required String code});
}
