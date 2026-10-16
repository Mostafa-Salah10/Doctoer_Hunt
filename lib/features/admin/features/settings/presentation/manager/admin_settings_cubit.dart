import 'dart:io';

import 'package:doctor_hunt/core/functions/get_patient_id.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/admin/features/settings/data/models/admin_model.dart';
import 'package:doctor_hunt/features/admin/features/settings/data/repo/admin_settings_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_settings_state.dart';

class AdminSettingsCubit extends Cubit<AdminSettingsState> {
  AdminSettingsCubit({required AdminSettingsRepo adminSettingsRepo})
    : _adminSettingsRepo = adminSettingsRepo,
      super(AdminSettingsState.init());

  final AdminSettingsRepo _adminSettingsRepo;

  Future<void> getCurrentAdmin() async {
    emit(state.copyWith(getCurrentAdmin: BoxState.loading()));

    final adminId = getCurrentUserId();

    final res = await _adminSettingsRepo.getCurrentAdmin(adminId: adminId!);

    res.fold(
      (e) {
        emit(state.copyWith(getCurrentAdmin: BoxState.error(error: e)));
      },
      (patient) {
        emit(state.copyWith(getCurrentAdmin: BoxState.success(data: patient)));
      },
    );
  }

  Future<void> updateCurrentAdmin(AdminModel admin) async {
    emit(state.copyWith(updateCurrentAdmin: BoxState.loading()));

    final res = await _adminSettingsRepo.updateCurrentAdmin(admin: admin);

    res.fold(
      (e) {
        emit(state.copyWith(updateCurrentAdmin: BoxState.error(error: e)));
      },
      (_) async {
        getCurrentAdmin();
        emit(
          state.copyWith(
            updateCurrentAdmin: BoxState.success(),
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
