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