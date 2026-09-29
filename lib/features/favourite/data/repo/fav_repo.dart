import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';

abstract class FavRepo {
  Future<Either<String, Set>> getFavDoctorsIds();
  Future<Either<String, List<DoctorEntity>>> getFavDoctors();
  Future<Either<String, Null>> addToFav({required String doctorId});
  Future<Either<String, Null>> removeFromFav({required String doctorId});
}
