import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/booking/data/models/doctor_available_day_model.dart';

abstract class BookingRepo {
  Future<Either<String, List<DoctorAvailableDayModel>>>
  getAvailableDaysWithSlots({required String doctorId});
}
