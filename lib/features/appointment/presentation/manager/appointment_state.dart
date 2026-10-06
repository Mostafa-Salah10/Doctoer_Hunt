part of 'appointment_cubit.dart';

class AppointmentState {
  final BookingStatus bookingStatus;
  final BoxState<List<AppointmentModel>> getAppointments;
  final Map<String, int> rates;
  final BoxState<String> cancelAppointment;
  final BoxState<String> rateDoctor;

  AppointmentState({
    required this.bookingStatus,
    required this.getAppointments,
    required this.rates,
    required this.cancelAppointment,
    required this.rateDoctor,
  });

  AppointmentState.init()
      : this(
          rates: {},
          bookingStatus: BookingStatus.upcoming,
          getAppointments: BoxState.initial(),
          cancelAppointment: BoxState.initial(),
          rateDoctor: BoxState.initial(),
        );

  AppointmentState copyWith({
    BookingStatus? bookingStatus,
    BoxState<List<AppointmentModel>>? getAppointments,
    Map<String, int>? rates,
    BoxState<String>? cancelAppointment,
    BoxState<String>? rateDoctor,
  }) {
    return AppointmentState(
      rates: rates ?? this.rates,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      getAppointments: getAppointments ?? this.getAppointments,
      cancelAppointment: cancelAppointment ?? this.cancelAppointment,
      rateDoctor: rateDoctor ?? this.rateDoctor,
    );
  }
}