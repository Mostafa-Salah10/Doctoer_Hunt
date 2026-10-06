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
}
