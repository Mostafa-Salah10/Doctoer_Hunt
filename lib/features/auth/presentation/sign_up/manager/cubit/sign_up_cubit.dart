import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.init());
  final signUpFormKey = GlobalKey<FormState>();

  void togglePasswordIcon() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void toggleAgreeWithTerms(bool? value) {
    emit(state.copyWith(agreeWithTerms: value));
  }
}
