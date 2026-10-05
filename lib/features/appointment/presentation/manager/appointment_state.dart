part of 'appointment_cubit.dart';

class AppointmentState {
  final BookingStatus bookingStatus;

  AppointmentState({required this.bookingStatus});

  AppointmentState.init() : this(bookingStatus: BookingStatus.upcoming);

  AppointmentState copyWith({BookingStatus? bookingStatus}) {
    return AppointmentState(bookingStatus: bookingStatus ?? this.bookingStatus);
  }
}
