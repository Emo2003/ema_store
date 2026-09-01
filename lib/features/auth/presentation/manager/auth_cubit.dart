import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/storage_service.dart';
import '../../data/models/User.dart';
import '../../data/repositories/auth_repo.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;

  AuthCubit(this.repo) : super(AuthInitial());

  static AuthCubit get(BuildContext context) {
    return BlocProvider.of<AuthCubit>(context);
  }

  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  User? user;
  String? resetEmail;
  String? resetCode;

  Future<void> login() async {
    emit(AuthLoading());

    try {
      final res = await repo.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      user = res.user;

      if (user != null) {
        await StorageService.saveUser(user!);
      }

      if (res.token != null) {
        await StorageService.saveToken(res.token!);
      }


      emit(AuthSuccess(message: 'Login successful', user: user));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> register() async {
    emit(AuthLoading());

    try {
      final res = await repo.register(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phone: phoneController.text.trim(),
        rePassword: confirmPasswordController.text.trim(),
      );

      user = res.user;

      if (user != null) {
        await StorageService.saveUser(user!);
      }

      if (res.token != null) {
        await StorageService.saveToken(res.token!);
      }

      emit(AuthSuccess(message: 'Create Account successful', user: user));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  void updateUser(User newUser) {
    user = newUser;
    emit(AuthUpdateUserState());
  }

  Future<void> forgetPassword(String email) async {
    emit(AuthForgetPasswordLoading());

    try {
      final cleanEmail = email.trim();

      await repo.forgetPassword(email: cleanEmail);
      resetEmail = cleanEmail;

      emit(AuthForgetPasswordSuccess(message: 'Password reset email sent'));
    } catch (e) {
      emit(AuthForgetPasswordFailure(error: e.toString()));
    }
  }

  Future<void> verifyCode(String code) async {
    emit(AuthVerifyCodeLoading());

    try {
      resetCode = code;

      await repo.verifyCode(code: code);

      emit(AuthVerifyCodeSuccess(message: 'Code verified successfully'));
    } catch (e) {
      emit(AuthVerifyCodeFailure(error: e.toString()));
    }
  }

  Future<void> resetPassword() async {
    final password = newPasswordController.text.trim();
    final rePassword = rePasswordController.text.trim();

    if (password.isEmpty || rePassword.isEmpty) {
      emit(
        AuthResetPasswordValidationFailure(
          error: "Please enter both passwords",
        ),
      );
      return;
    }

    if (password.length < 6) {
      emit(
        AuthResetPasswordValidationFailure(
          error: "Password must be at least 6 characters",
        ),
      );
      return;
    }

    if (password != rePassword) {
      emit(AuthResetPasswordValidationFailure(error: "Passwords do not match"));
      return;
    }

    if (resetEmail == null || resetEmail!.isEmpty) {
      emit(
        AuthResetPasswordValidationFailure(
          error: "Email is missing. Please restart the password reset process.",
        ),
      );
      return;
    }

    emit(AuthResetPasswordLoading());

    try {
      await repo.resetPassword(
        email: resetEmail!,
        newPassword: password,
        rePassword: rePassword,
      );

      emit(AuthResetPasswordSuccess(message: "Password reset successful"));
    } catch (e) {
      emit(AuthResetPasswordFailure(error: e.toString()));
    }
  }

  Future<void> logout() async {
    await StorageService.clearAll();

    user = null;

    emit(AuthLoggedOut());
  }
  Future<bool> isLoggedIn() async {
    final token = await StorageService.getToken();

    return token != null && token.isNotEmpty;
  }

  Future<void> restoreUser() async {
    final token = await StorageService.getToken();

    if (token == null || token.isEmpty) {
      emit(AuthLoggedOut());
      return;
    }

    final savedUser = await StorageService.getUser();

    if (savedUser == null) {
      emit(AuthLoggedOut());
      return;
    }

    user = savedUser;

    emit(
      AuthSuccess(
        message: 'User restored',
        user: user,
      ),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    newPasswordController.dispose();
    rePasswordController.dispose();

    return super.close();
  }
}
