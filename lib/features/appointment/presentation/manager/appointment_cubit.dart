import 'package:doctor_hunt/core/enums/booking_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentState.init());

  void updateBookingStatus(BookingStatus bookingStatus) {
    emit(state.copyWith(bookingStatus: bookingStatus));
  }
}
