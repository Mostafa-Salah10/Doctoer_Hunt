import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/models/doctor_working_day_model.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/repo/doctor_availability_repo.dart';

class DoctorAvailabilityRepoImpl implements DoctorAvailabilityRepo {
  final FirebaseFirestore _firebaseFirestore;

  DoctorAvailabilityRepoImpl({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore;
  @override
  Future<Either<String, DoctorAvailabilityModel>> getWorkingDays({
    required String doctorId,
  }) async {
    try {
      final response = await _firebaseFirestore
          .collection('availability')
          .doc(doctorId)
          .get();

      if (!response.exists) {
        return right(DoctorAvailabilityModel.defaultData());
      }

      return right(DoctorAvailabilityModel.fromJson(response.data()!));
    } catch (e) {
      return left(e.toString());
    }
  }
}
