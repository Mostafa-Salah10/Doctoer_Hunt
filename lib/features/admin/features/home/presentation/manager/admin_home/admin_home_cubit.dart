import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/database/shared/domain/usecases/get_all_doctors.dart';
import 'package:doctor_hunt/core/enums/request_state.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/enitites/doctor_statistics_entity.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/use_case/delete_doctor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_home_state.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  AdminHomeCubit({
    required GetAllDoctors allDoctors,
    required DeleteDoctor deleteDoctor,
  }) : _deleteDoctor = deleteDoctor,
       _allDoctors = allDoctors,

       super(AdminHomeState.init());

  final GetAllDoctors _allDoctors;
  final DeleteDoctor _deleteDoctor;

  Future<void> getAllDoctors() async {
    emit(state.copyWith(getAllDoctors: BoxState.loading()));

    final result = await _allDoctors.call();

    result.fold(
      (err) => emit(
        state.copyWith(
          errorType: ErrorTypes.server,
          getAllDoctors: BoxState.error(),
        ),
      ),
      (specialities) {
        emit(
          state.copyWith(getAllDoctors: BoxState.success(data: specialities)),
        );

        calculateNumberOfDoctorsAndActiveDoctors();
      },
    );
  }

  Future<void> deleteDoctor({required String doctorId}) async {
    if (state.deleteDoctor.isLoading) return;

    emit(state.copyWith(deleteDoctor: BoxState.loading()));

    final result = await _deleteDoctor.call(doctorId: doctorId);

    result.fold(
      (err) => emit(state.copyWith(deleteDoctor: BoxState.error(error: err))),
      (_) {
        emit(state.copyWith(deleteDoctor: BoxState.success(data: doctorId)));
        getAllDoctors();
        // final List<DoctorEntity> docs = [...state.getAllDoctors.data!];

        // bool isActive = false;

        // docs.removeWhere((doc) {
        //   if (doc.id == doctorId) {
        //     isActive = doc.isActive;
        //     return true;
        //   }

        //   return false;
        // });

        // emit(
        //   state.copyWith(
        //     deleteDoctor: BoxState.success(),
        //     getAllDoctors: BoxState.success(data: docs),
        //     doctorStatistics: DoctorStatisticsEntity(
        //       numberOfDoctors: state.doctorStatistics!.numberOfDoctors - 1,
        //       numberOfActiveDoctors: isActive
        //           ? state.doctorStatistics!.numberOfActiveDoctors - 1
        //           : state.doctorStatistics!.numberOfActiveDoctors,
        //     ),
        //   ),
        // );
      },
    );
  }

  void calculateNumberOfDoctorsAndActiveDoctors() {
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
