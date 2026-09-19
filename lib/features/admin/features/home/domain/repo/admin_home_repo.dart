import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/enitites/docotor_speciality_entity.dart';

abstract class AdminHomeRepo {
  Future<Either<String, List<DocotorSpecialityEntity>>> getDoctorSpecialities();
  Future<Either<String, Null>> createDoctor({
    required String name,
    required String speciality,
    required File image,
  });
}
