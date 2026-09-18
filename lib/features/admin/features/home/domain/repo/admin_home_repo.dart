import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/enitites/docotor_speciality_entity.dart';

abstract class AdminHomeRepo {
  Future<Either<String, List<DocotorSpecialityEntity>>> getDoctorSpecialities();
}
