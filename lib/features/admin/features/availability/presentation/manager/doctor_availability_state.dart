part of 'doctor_availability_cubit.dart';

class DoctorAvailabilityState {
  final BoxState<DoctorAvailabilityModel> workingDays;
  final BoxState updateWorkingDays;
  final BoxState addSlotsAndWorkingDays;

  final int enabledDays;

  DoctorAvailabilityState({
    required this.addSlotsAndWorkingDays,
    required this.workingDays,
    required this.enabledDays,

    required this.updateWorkingDays,
  });

  DoctorAvailabilityState.init()
    : this(
        workingDays: BoxState.initial(),
        enabledDays: 0,
        updateWorkingDays: BoxState.initial(),
        addSlotsAndWorkingDays: BoxState.initial(),
      );

  DoctorAvailabilityState copyWith({
    BoxState<DoctorAvailabilityModel>? workingDays,
    BoxState? updateWorkingDays,
    BoxState? addSlotsAndWorkingDays,

    int? enabledDays,
  }) {
    return DoctorAvailabilityState(
      addSlotsAndWorkingDays:
          addSlotsAndWorkingDays ?? this.addSlotsAndWorkingDays,
      updateWorkingDays: updateWorkingDays ?? this.updateWorkingDays,
      enabledDays: enabledDays ?? this.enabledDays,
      workingDays: workingDays ?? this.workingDays,
    );
  }
}
