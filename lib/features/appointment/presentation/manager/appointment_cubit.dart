import 'package:doctor_hunt/core/enums/booking_status.dart';
import 'package:doctor_hunt/core/functions/get_patient_id.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';
import 'package:doctor_hunt/features/appointment/data/repo/appointment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit({required AppointmentRepo appointmentRepo})
    : _appointmentRepo = appointmentRepo,
      super(AppointmentState.init());

  final AppointmentRepo _appointmentRepo;

  List<AppointmentModel> appointments = [];

  void updateBookingStatus(BookingStatus bookingStatus) {
    emit(
      state.copyWith(
        bookingStatus: bookingStatus,
        getAppointments: BoxState.success(
          data: filterAppointmentsByStatus(bookingStatus),
        ),
      ),
    );
  }

  Future<void> getPatientAppointments() async {
    emit(state.copyWith(getAppointments: BoxState.loading()));

    final patientId = getPatientId();

    final res = await _appointmentRepo.getPatientAppointment(
      patientId: patientId!,
    );

    res.fold(
      (err) {
        emit(state.copyWith(getAppointments: BoxState.error(error: err)));
      },
      (appointments) {
        this.appointments = appointments;

        emit(
          state.copyWith(
            getAppointments: BoxState.success(
              data: filterAppointmentsByStatus(state.bookingStatus),
            ),
          ),
        );
      },
    );
  }

  List<AppointmentModel> filterAppointmentsByStatus(BookingStatus status) {
    return appointments.where((appo) => appo.status == status).toList();
  }

  void updateDoctorRate({required int rate, required String appointmentId}) {
    final rates = Map<String, int>.from(state.rates);

    rates[appointmentId] = rate;

    emit(state.copyWith(rates: rates));
  }

  Future<void> cancelAppointment({
    required AppointmentModel appointment,
  }) async {
    emit(
      state.copyWith(
        cancelAppointment: BoxState.loading(data: appointment.bookingId),
      ),
    );

    final res = await _appointmentRepo.cancelAppointment(
      appoitment: appointment,
    );

    res.fold(
      (error) {
        emit(state.copyWith(cancelAppointment: BoxState.error(error: error)));
      },
      (_) {
        appointment.status = BookingStatus.cancelled;

        emit(
          state.copyWith(
            cancelAppointment: BoxState.success(),
            getAppointments: BoxState.success(
              data: filterAppointmentsByStatus(state.bookingStatus),
            ),
          ),
        );
      },
    );
  }

  Future<void> rateDoctor({
    required String doctorId,
    required String appointmentId,
  }) async {
    final patientId = getPatientId();

    final rate = state.rates[appointmentId];

    if (rate == null) {
      return;
    }

    emit(state.copyWith(rateDoctor: BoxState.loading(data: appointmentId)));

    final res = await _appointmentRepo.rateDoctor(
      doctorId: doctorId,
      patientId: patientId!,
      appointmentId: appointmentId,
      rate: rate,
    );

    res.fold(
      (error) {
        emit(state.copyWith(rateDoctor: BoxState.error(error: error)));
      },
      (_) {
        emit(state.copyWith(rateDoctor: BoxState.success(data: null)));
      },
    );
  }
}
