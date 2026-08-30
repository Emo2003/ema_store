import 'package:ema_store/features/auth/data/models/Auth_response.dart';

abstract class AuthRepo {
  Future<AuthResponse>login({
    required String email,
    required String password
});
  Future<AuthResponse>register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
});
}