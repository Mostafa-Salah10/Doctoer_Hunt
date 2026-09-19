import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_enitity.dart';
import 'package:doctor_hunt/core/database/shared/domain/repo/shared_repository.dart';
import 'package:doctor_hunt/core/database/shared/domain/usecases/get_all_doctors.dart';
import 'package:doctor_hunt/core/enums/request_state.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/enitites/doctor_statistics_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_home_state.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  AdminHomeCubit({required SharedRepository sharedRepository})
    : _sharedRepository = sharedRepository,
      super(AdminHomeState.init());

  final SharedRepository _sharedRepository;

  Future<void> getAllDoctors() async {
    emit(state.copyWith(getAllDoctors: BoxState.loading()));

    final result = await GetAllDoctors(
      sharedRepository: _sharedRepository,
    ).call();

    result.fold((err) => emit(state.copyWith(errorType: ErrorTypes.server)), (
      specialities,
    ) {
      emit(state.copyWith(getAllDoctors: BoxState.success(data: specialities)));

      calcuteNumberOfDoctorsAndActiveDoctors();
    });
  }

  void calcuteNumberOfDoctorsAndActiveDoctors() {
    int nOfDocs = state.getAllDoctors.data!.length;
    int nOfActDocs = 0;
    for (var doctor in state.getAllDoctors.data!) {
      if (doctor.isActive) {
        nOfActDocs++;
      }
    }

    emit(
      state.copyWith(
        doctorStatistics: DoctorStatisticsEntity(
          numberOfActiveDoctors: nOfActDocs,
          numberOfDoctors: nOfDocs,
        ),
      ),
    );
  }
}
