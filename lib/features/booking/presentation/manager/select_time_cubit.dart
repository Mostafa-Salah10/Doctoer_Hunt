import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/booking/data/models/doctor_available_day_model.dart';
import 'package:doctor_hunt/features/booking/data/models/slot_model.dart';
import 'package:doctor_hunt/features/booking/data/repo/booking_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_time_state.dart';

class SelectTimeCubit extends Cubit<SelectTimeState> {
  SelectTimeCubit({required BookingRepo bookingRepo})
    : _bookingRepo = bookingRepo,
      super(SelectTimeState.init());

  final BookingRepo _bookingRepo;

  SlotModel? currentSlot;

  void changeSelectedDay(int index) {
    emit(state.copyWith(currenDaytIndex: index));
    emit(
      state.copyWith(
        afternoonSlots: state.availableDaysState.data![index].afternoonSlots,
        eveningSlots: state.availableDaysState.data![index].eveningSlots,
      ),
    );
  }

  void changeSelectedAfterNoonTime(int index, {required SlotModel slot}) {
    currentSlot = slot;
    emit(state.copyWith(currenAfterNoontIndex: index, currenEveningtIndex: -1));
  }

  void changeSelectedEveningTime(int index, {required SlotModel slot}) {
    currentSlot = slot;
    emit(state.copyWith(currenEveningtIndex: index, currenAfterNoontIndex: -1));
  }

  Future<void> fetchDoctorAvailableDays(String doctorId) async {
    emit(state.copyWith(availableDaysState: BoxState.loading()));

    final result = await _bookingRepo.getAvailableDaysWithSlots(
      doctorId: doctorId,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(availableDaysState: BoxState.error(error: failure)),
        );
      },
      (availableDays) {
        if (availableDays.isNotEmpty) {
          emit(
            state.copyWith(
              availableDaysState: BoxState.success(data: availableDays),
              afternoonSlots: availableDays.first.afternoonSlots,
              eveningSlots: availableDays.first.eveningSlots,
            ),
          );
        } else {
          emit(
            state.copyWith(
              availableDaysState: BoxState.success(data: availableDays),
            ),
          );
        }
      },
    );
  }

  Future<void> bookWithDoctor({
    required String patientId,
    required String doctorId,
  }) async {
    emit(state.copyWith(bookWithDoctor: BoxState.loading()));

    if (state.currenAfterNoontIndex == -1 && state.currenEveningtIndex == -1) {
      emit(
        state.copyWith(
          bookWithDoctor: BoxState.error(error: "You should choose slot"),
        ),
      );
      return;
    }

    final res = await _bookingRepo.bookWithDoctor(
      patientId: patientId,
      doctorId: doctorId,
      slot: currentSlot!,
      date: state.availableDaysState.data![state.currenDaytIndex].availableDay,
    );

    res.fold(
      (err) {
        emit(state.copyWith(bookWithDoctor: BoxState.error(error: err)));
      },
      (_) {
        currentSlot = null;
        fetchDoctorAvailableDays(doctorId);
        emit(
          state.copyWith(
            bookWithDoctor: BoxState.success(),
            currenAfterNoontIndex: -1,
            currenEveningtIndex: -1,
          ),
        );
      },
    );
  }
}
