import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';

abstract class HomeRepo {
  Future<Either<String, List<DoctorEntity>>> getPopularDoctors({
    required String speciality,
    required int limit,
  });
  Future<Either<String, List<DoctorEntity>>> getFeatureDoctors({
    required String speciality,
    required int limit,
  });
}
