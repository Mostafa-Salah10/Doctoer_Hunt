import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/models/doctor_working_day_model.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/repo/doctor_availability_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_availability_state.dart';

class DoctorAvailabilityCubit extends Cubit<DoctorAvailabilityState> {
  DoctorAvailabilityCubit({required DoctorAvailabilityRepo repo})
    : _repo = repo,
      super(DoctorAvailabilityState.init());

  final DoctorAvailabilityRepo _repo;

  Future<void> getWorkingDays({required String doctorId}) async {
    emit(state.copyWith(workingDays: BoxState.loading()));
    final res = await _repo.getWorkingDays(doctorId: doctorId);

    res.fold(
      (e) {
        emit(state.copyWith(workingDays: BoxState.error(error: e)));
      },
      (workingDays) {
        final enabledDays = calculateActiveWorkingDays(workingDays.workingDays);
        emit(
          state.copyWith(
            workingDays: BoxState.success(data: workingDays),
            enabledDays: enabledDays,
          ),
        );
      },
    );
  }

  int calculateActiveWorkingDays(List<DoctorWorkingDayModel> days) {
    int enabledDays = 0;
    for (var day in days) {
      if (day.isActive) {
        enabledDays++;
      }
    }

    return enabledDays;
  }

  void toggleDayAvailability(DoctorWorkingDayModel day, bool isActive) {
    day.isActive = isActive;
    emit(
      state.copyWith(
        enabledDays: calculateActiveWorkingDays(
          state.workingDays.data!.workingDays,
        ),
      ),
    );
  }
}
