import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/database/shared/data/models/doctor_model.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/features/home/data/repo/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final FirebaseFirestore _firebaseFirestore;

  HomeRepoImp({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore;

  @override
  Future<Either<String, List<DoctorEntity>>> getFeatureDoctors({
    required String speciality,
    required int limit,
  }) async {
    try {
      final result = await _firebaseFirestore
          .collection('doctors')
          .where('isFeature', isEqualTo: true)
          .where('speciality', isEqualTo: speciality)
          .limit(limit)
          .get();

      final List<DoctorEntity> doctors = [];

      for (var doctor in result.docs) {
        doctors.add(DoctorModel.fromJson(doctor.data(), id: doctor.id));
      }

      return right(doctors);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<DoctorEntity>>> getPopularDoctors({
    required String speciality,
    required int limit,
  }) async {
    try {
      final result = await _firebaseFirestore
          .collection('doctors')
          .where('speciality', isEqualTo: speciality)
          .orderBy('rating', descending: true)
          .limit(limit)
          .get();

      final List<DoctorEntity> doctors = [];

      for (var doctor in result.docs) {
        doctors.add(DoctorModel.fromJson(doctor.data(), id: doctor.id));
      }

      return right(doctors);
    } catch (e) {
      return left(e.toString());
    }
  }
}
