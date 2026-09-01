import '../../data/models/User.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String message;
  final User? user;

  AuthSuccess({required this.message, required this.user});
}

final class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}

final class AuthUpdateUserState extends AuthState {}

//forget password states
final class AuthForgetPasswordLoading extends AuthState {}

final class AuthForgetPasswordSuccess extends AuthState {
  final String message;

  AuthForgetPasswordSuccess({required this.message});
}

final class AuthForgetPasswordFailure extends AuthState {
  final String error;

  AuthForgetPasswordFailure({required this.error});
}

//reset password states
final class AuthResetPasswordLoading extends AuthState {}

final class AuthResetPasswordSuccess extends AuthState {
  final String message;

  AuthResetPasswordSuccess({required this.message});
}

final class AuthResetPasswordFailure extends AuthState {
  final String error;

  AuthResetPasswordFailure({required this.error});
}

//verify code states
final class AuthVerifyCodeLoading extends AuthState {}

final class AuthVerifyCodeSuccess extends AuthState {
  final String message;

  AuthVerifyCodeSuccess({required this.message});
}

final class AuthVerifyCodeFailure extends AuthState {
  final String error;

  AuthVerifyCodeFailure({required this.error});
}

class AuthResetPasswordValidationFailure extends AuthState {
  final String error;

  AuthResetPasswordValidationFailure({required this.error});
}
class AuthLoggedOut extends AuthState {}