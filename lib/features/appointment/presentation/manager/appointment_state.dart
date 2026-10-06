part of 'appointment_cubit.dart';

class AppointmentState {
  final BookingStatus bookingStatus;

  final BoxState<List<AppointmentModel>> getAppointments;

  AppointmentState({
    required this.bookingStatus,
    required this.getAppointments,
  });

  AppointmentState.init()
    : this(
        bookingStatus: BookingStatus.upcoming,
        getAppointments: BoxState.initial(),
      );

  AppointmentState copyWith({
    BookingStatus? bookingStatus,
    BoxState<List<AppointmentModel>>? getAppointments,
  }) {
    return AppointmentState(
      bookingStatus: bookingStatus ?? this.bookingStatus,
      getAppointments: getAppointments ?? this.getAppointments,
    );
  }
}
