
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

  void changeSelectedDay(int index) {
    emit(state.copyWith(currenDaytIndex: index));
    emit(
      state.copyWith(
        afternoonSlots: state.availableDaysState.data![index].afternoonSlots,
        eveningSlots: state.availableDaysState.data![index].eveningSlots,
      ),
    );
  }

  void changeSelectedAfterNoonTime(int index) {
    emit(state.copyWith(currenAfterNoontIndex: index));
  }

  void changeSelectedEveningTime(int index) {
    emit(state.copyWith(currenEveningtIndex: index));
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
}
