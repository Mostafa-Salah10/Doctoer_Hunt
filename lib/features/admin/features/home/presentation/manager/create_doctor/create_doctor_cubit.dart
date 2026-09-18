import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/enitites/docotor_speciality_entity.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/repo/admin_home_repo.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/use_case/create_doctor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_doctor_state.dart';

class CreateDoctorCubit extends Cubit<CreateDoctorState> {
  CreateDoctorCubit(this._adminHomeRepo) : super(CreateDoctorState.init());
  final AdminHomeRepo _adminHomeRepo;

  Future<void> getDoctorSpecialitis() async {
    emit(state.copyWith(getDoctorSpecialities: BoxState.loading()));

    final result = await CreateDoctor(adminHomeRepo: _adminHomeRepo).call();

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
}
