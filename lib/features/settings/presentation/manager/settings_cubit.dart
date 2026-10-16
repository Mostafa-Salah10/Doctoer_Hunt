import 'dart:io';

import 'package:doctor_hunt/core/functions/get_patient_id.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/settings/data/models/patient_model.dart';
import 'package:doctor_hunt/features/settings/data/repo/settings_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required SettingsRepo settingsRepo})
    : _settingsRepo = settingsRepo,
      super(SettingsState.init());

  final SettingsRepo _settingsRepo;

  Future<void> getCurrentPatient() async {
    emit(state.copyWith(getCurrentPatient: BoxState.loading()));

    final patientId = getCurrentUserId();
    final res = await _settingsRepo.getCurrentPatient(patientId: patientId!);

    res.fold(
      (e) {
        emit(state.copyWith(getCurrentPatient: BoxState.error(error: e)));
      },
      (patient) {
        emit(
          state.copyWith(getCurrentPatient: BoxState.success(data: patient)),
        );
      },
    );
  }

  Future<void> updateCurrentPatient(PatientModel patient) async {
    emit(state.copyWith(updateCurrentPatient: BoxState.loading()));

    final res = await _settingsRepo.updateCurrentPatient(patient: patient);

    res.fold(
      (e) {
        emit(state.copyWith(updateCurrentPatient: BoxState.error(error: e)));
      },
      (_) async{
        getCurrentPatient();
        emit(
          state.copyWith(
            updateCurrentPatient: BoxState.success(),
            profileImage: null,
          ),
        );
      },
    );
  }

  void chooseProfileImage(File image) {
    emit(state.copyWith(profileImage: image));
  }


}
