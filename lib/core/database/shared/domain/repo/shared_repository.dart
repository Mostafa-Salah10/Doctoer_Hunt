import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_enitity.dart';

abstract class SharedRepository {
  Future<Either<String, List<DoctorEnitity>>> getAllDoctors();
}
