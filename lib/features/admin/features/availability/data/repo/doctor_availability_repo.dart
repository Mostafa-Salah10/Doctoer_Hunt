import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/models/doctor_working_day_model.dart';

abstract class DoctorAvailabilityRepo {
  Future<Either<String, DoctorAvailabilityModel>> getWorkingDays({
    required String doctorId,
  });

  Future<Either<String, DoctorAvailabilityModel>> updateWorkingDays({
    required String doctorId,
    required DoctorAvailabilityModel availability,
  });

  Future<Either<String, void>> addSlot({
    required String doctorId,
    required String date,
    required String startTime,
    required String endTime,
  });
}
