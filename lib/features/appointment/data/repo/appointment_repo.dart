import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';

abstract class AppointmentRepo {
  Future<Either<String, List<AppointmentModel>>> getPatientAppointment({
    required String patientId,
  });
}
