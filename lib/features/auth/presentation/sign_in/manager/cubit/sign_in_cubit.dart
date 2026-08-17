import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState.init());
  final signInFormKey = GlobalKey<FormState>();

  void togglePasswordIcon() =>
      emit(state.copyWith(showPassword: !state.showPassword));

  void validateEmail(String? email) {
    if (email == null) return;
    if (AppValidators.email(email) == null) {
      emit(state.copyWith(validEmail: true));
    } else {
      emit(state.copyWith(validEmail: false));
    }
  }
}
