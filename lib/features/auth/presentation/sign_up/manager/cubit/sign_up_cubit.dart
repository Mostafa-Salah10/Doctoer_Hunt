import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(SignUpState.init());

  final AuthRepo _authRepo;
  final signUpFormKey = GlobalKey<FormState>();

  void togglePasswordIcon() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void toggleAgreeWithTerms(bool? value) {
    emit(state.copyWith(agreeWithTerms: value));
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required Role role,
  }) async {
    if (signUpFormKey.currentState?.validate() ?? false) {
      emit(state.copyWith(signUp: BoxState.loading()));
      final result = await _authRepo.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
        role: role,
      );
      result.fold(
        (error) => emit(state.copyWith(signUp: BoxState.error(error: error))),
        (_) => emit(state.copyWith(signUp: BoxState.success())),
      );
    }
  }
}
