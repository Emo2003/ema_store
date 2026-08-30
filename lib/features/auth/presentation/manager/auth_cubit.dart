import 'package:ema_store/features/auth/data/repositories/auth_repo.dart';
import 'package:ema_store/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/User.dart';

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

  User? user;

  Future<void> login() async {
    emit(AuthLoading());

    try {
      final res = await repo.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      user = res.user;
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
      emit(AuthSuccess(message: 'Create Account  successful', user: user));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();

    return super.close();
  }
}
