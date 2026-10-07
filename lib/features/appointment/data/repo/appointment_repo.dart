import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';

abstract class AppointmentRepo {
  Future<Either<String, List<AppointmentModel>>> getPatientAppointment({
    required String patientId,
  });
  Future<Either<String, List<AppointmentModel>>> getAllAppointment();
  Future<Either<String, Null>> cancelAppointment({
    required AppointmentModel appoitment,
  });
  Future<Either<String, Null>> markAppointmentAsCompleted({
    required AppointmentModel appoitment,
  });
  Future<Either<String, Null>> rateDoctor({
    required String doctorId,
    required String patientId,
    required String appointmentId,
    required int rate,
  });
}
