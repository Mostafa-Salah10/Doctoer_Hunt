import 'dart:io';

import 'package:doctor_hunt/core/functions/pick_image_from_device.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/enitites/docotor_speciality_entity.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/repo/admin_home_repo.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/use_case/create_doctor.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/use_case/get_doctor_specialities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_doctor_state.dart';

class CreateDoctorCubit extends Cubit<CreateDoctorState> {
  CreateDoctorCubit(this._adminHomeRepo) : super(CreateDoctorState.init());
  final AdminHomeRepo _adminHomeRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> getDoctorSpecialitis() async {
    emit(state.copyWith(getDoctorSpecialities: BoxState.loading()));

    final result = await GetDoctorSpecialities(
      adminHomeRepo: _adminHomeRepo,
    ).call();

    result.fold(
      (err) {
        emit(state.copyWith(getDoctorSpecialities: BoxState.error(error: err)));
      },
      (specialities) {
        emit(
          state.copyWith(
            getDoctorSpecialities: BoxState.success(data: specialities),
          ),
        );
      },
    );
  }

  Future<void> createDoctor({
    required String doctorName,
    required String doctorSpeciality,
  }) async {
    if (state.createDoctor.isLoading) return;
    emit(state.copyWith(createDoctor: BoxState.loading()));

    final result = await CreateDoctor(adminHomeRepo: _adminHomeRepo).call(
      name: doctorName,
      speciality: doctorSpeciality,
      image: state.doctorImage!,
    );

    result.fold(
      (err) => emit(state.copyWith(createDoctor: BoxState.error(error: err))),
      (_) => emit(
        state.copyWith(createDoctor: BoxState.success(), doctorImage: null),
      ),
    );
  }

  Future<void> pcikDoctorImage() async {
    final image = await pickImageFromDevice();
    if (image != null) {
      emit(state.copyWith(doctorImage: image));
    }
  }
}
