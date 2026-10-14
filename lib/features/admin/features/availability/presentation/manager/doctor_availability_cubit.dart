import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/core/helpers/date_time_helper.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/models/doctor_working_day_model.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/repo/doctor_availability_repo.dart';
import 'package:flutter/material.dart';
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

  void updateWorkingHours(TimeOfDay time, bool isStart) {
    final availability = state.workingDays.data!;
    if (isStart) {
      availability.startTime = time;
    } else {
      availability.endTime = time;
    }

    emit(state.copyWith());
  }

  void updateSlotDuration(double slot) {
    final availability = state.workingDays.data!;
    availability.slotDuration = slot;

    emit(state.copyWith());
  }

  Future<Either<String, DoctorAvailabilityModel>> updateWorkingDays(
    String doctorId,
  ) async {
    emit(state.copyWith(updateWorkingDays: BoxState.initial()));

    final res = await _repo.updateWorkingDays(
      doctorId: doctorId,
      availability: state.workingDays.data!,
    );
    res.fold(
      (e) {
        emit(state.copyWith(updateWorkingDays: BoxState.error(error: e)));
      },
      (_) {
        emit(state.copyWith(updateWorkingDays: BoxState.success()));
      },
    );

    return res;
  }

  Future<void> addSlotsAndWorkingDays(String doctorId) async {
    final addWorkingDayRes = await updateWorkingDays(doctorId);
    if (addWorkingDayRes.isLeft()) return;

    emit(state.copyWith(addSlotsAndWorkingDays: BoxState.loading()));

    try {
      final data = state.workingDays.data!;

      for (final workingDay in data.workingDays) {
        if (!workingDay.isActive) continue;

        final date = DateTimeHelper.getDateOfAnyNextDay(workingDay.weekday);

        final formatedDate = DateTimeHelper.formateDateToRegularString(date);

        var currentStartTime = TimeOfDay(
          hour: data.startTime.hour,
          minute: data.startTime.minute,
        );

        var currentEndTime = DateTimeHelper.addMinutes(
          currentStartTime,
          data.slotDuration.toInt(),
        );

        while (currentEndTime.isBefore(
          DateTimeHelper.addMinutes(data.endTime, 1),
        )) {
          final startTime = DateTimeHelper.formateTimeToAMAndPM(
            currentStartTime,
          );

          final endTime = DateTimeHelper.formateTimeToAMAndPM(currentEndTime);

          final addSlotRes = await _repo.addSlot(
            doctorId: doctorId,
            date: formatedDate,
            startTime: startTime,
            endTime: endTime,
          );

          if (addSlotRes.isLeft()) {
            addSlotRes.fold((error) => throw Exception(error), (_) {});
          }

          currentStartTime = currentEndTime;

          currentEndTime = DateTimeHelper.addMinutes(
            currentStartTime,
            data.slotDuration.toInt(),
          );
        }
      }

      state.workingDays.data!.fristSet = false;

      emit(state.copyWith(addSlotsAndWorkingDays: BoxState.success()));
    } catch (e) {
      emit(
        state.copyWith(
          addSlotsAndWorkingDays: BoxState.error(error: e.toString()),
        ),
      );
    }
  }
}
