import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(SignInState.init());

  final AuthRepo _authRepo;
  final signInFormKey = GlobalKey<FormState>();
  final forgotFormKey = GlobalKey<FormState>();
  final sendCodeFormKey = GlobalKey<FormState>();
  final resetFormKey = GlobalKey<FormState>();
  String otpCode = "";

  void togglePasswordIcon() =>
      emit(state.copyWith(showPassword: !state.showPassword));

  void toggleNewPasswordIcon() =>
      emit(state.copyWith(showNewPassword: !state.showNewPassword));

  void toggleReEnterPasswordIcon() =>
      emit(state.copyWith(showReEnterPassword: !state.showReEnterPassword));

  void validateEmail(String? email) {
    if (email == null) return;
    if (AppValidators.email(email) == null) {
      emit(state.copyWith(validEmail: true));
    } else {
      emit(state.copyWith(validEmail: false));
    }
  }

  void validateForgotPassEmail(String? email) {
    if (email == null) return;
    if (AppValidators.email(email) == null) {
      emit(state.copyWith(forgotPassValidEmail: true));
    } else {
      emit(state.copyWith(forgotPassValidEmail: false));
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (signInFormKey.currentState?.validate() ?? false) {
      emit(state.copyWith(signIn: BoxState.loading()));
      final result = await _authRepo.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      result.fold(
        (error) => emit(state.copyWith(signIn: BoxState.error(error: error))),
        (role) => emit(state.copyWith(signIn: BoxState.success(data: role))),
      );
    }
  }

  Future<void> resetPassword({required String email}) async {
    if (resetFormKey.currentState!.validate()) {
      emit(state.copyWith(resetPassword: BoxState.loading()));
      final result = await _authRepo.resetPass(email: email);
      result.fold(
        (error) =>
            emit(state.copyWith(resetPassword: BoxState.error(error: error))),
        (_) => emit(state.copyWith(resetPassword: BoxState.success())),
      );
    }
  }
}
