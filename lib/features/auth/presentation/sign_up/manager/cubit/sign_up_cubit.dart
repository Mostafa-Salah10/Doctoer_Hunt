import 'dart:io';

import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/auth/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  void setProfileImage(File image) {
    emit(state.copyWith(profileImage: image));
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

  Future<void> completeInfo({required String phone}) async {
    emit(state.copyWith(completeInfo: BoxState.loading()));
    final result = await _authRepo.setPaientProfile(
      phone: phone,
      image: state.profileImage!,
      patientId: FirebaseAuth.instance.currentUser!.uid,
    );
    result.fold(
      (error) => emit(state.copyWith(completeInfo: BoxState.error(error: error))),
      (_) => emit(state.copyWith(completeInfo: BoxState.success(),profileImage: null)),
    );
  }
}
