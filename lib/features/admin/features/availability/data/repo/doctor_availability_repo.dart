import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/models/doctor_working_day_model.dart';

abstract class DoctorAvailabilityRepo {
  Future<Either<String, DoctorAvailabilityModel>> getWorkingDays({
    required String doctorId,
  });
}
