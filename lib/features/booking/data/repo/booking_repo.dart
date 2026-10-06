import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/features/booking/data/models/doctor_available_day_model.dart';
import 'package:doctor_hunt/features/booking/data/models/slot_model.dart';

abstract class BookingRepo {
  Future<Either<String, List<DoctorAvailableDayModel>>>
  getAvailableDaysWithSlots({required String doctorId});

  Future<Either<String, Null>> bookWithDoctor({
    required String patientId,
    required DoctorEntity doctor,
    required SlotModel slot,
    required String date,
  });
}
