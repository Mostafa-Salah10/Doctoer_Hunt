part of 'doctor_availability_cubit.dart';

class DoctorAvailabilityState {
  final BoxState<DoctorAvailabilityModel> workingDays;

  final int enabledDays;

  DoctorAvailabilityState({
    required this.workingDays,
    required this.enabledDays,
  });

  DoctorAvailabilityState.init()
    : this(workingDays: BoxState.initial(), enabledDays: 0);

  DoctorAvailabilityState copyWith({
    BoxState<DoctorAvailabilityModel>? workingDays,

    int? enabledDays,
  }) {
    return DoctorAvailabilityState(
      enabledDays: enabledDays ?? this.enabledDays,
      workingDays: workingDays ?? this.workingDays,
    );
  }
}
