part of 'admin_home_cubit.dart';

class AdminHomeState {
  final BoxState<List<DoctorEnitity>> getAllDoctors;

  final BoxState<void> deleteDoctor;
  final BoxState<void> updateDoctor;

  final ErrorTypes? errorType;

  final DoctorStatisticsEntity? doctorStatistics;

  AdminHomeState({
    required this.getAllDoctors,
    required this.deleteDoctor,
    required this.updateDoctor,
    this.errorType,
    this.doctorStatistics,
  });

  AdminHomeState.init()
    : this(
        getAllDoctors: BoxState.initial(),
        deleteDoctor: BoxState.initial(),
        updateDoctor: BoxState.initial(),
      );

  AdminHomeState copyWith({
    BoxState<List<DoctorEnitity>>? getAllDoctors,
    BoxState<void>? deleteDoctor,
    BoxState<void>? updateDoctor,
    ErrorTypes? errorType,
    DoctorStatisticsEntity? doctorStatistics,
  }) {
    return AdminHomeState(
      getAllDoctors: getAllDoctors ?? this.getAllDoctors,
      deleteDoctor: deleteDoctor ?? this.deleteDoctor,
      updateDoctor: updateDoctor ?? this.updateDoctor,
      errorType: errorType,
      doctorStatistics: doctorStatistics ?? this.doctorStatistics,
    );
  }
}
