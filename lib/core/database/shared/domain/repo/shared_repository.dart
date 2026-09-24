import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';

abstract class SharedRepository {
  Future<Either<String, List<DoctorEntity>>> getAllDoctors();
}
