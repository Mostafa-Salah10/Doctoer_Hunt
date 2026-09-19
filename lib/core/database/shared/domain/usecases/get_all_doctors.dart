
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_enitity.dart';
import 'package:doctor_hunt/core/database/shared/domain/repo/shared_repository.dart';

class GetAllDoctors {
  final SharedRepository _sharedRepository;

  GetAllDoctors({required SharedRepository sharedRepository})
    : _sharedRepository = sharedRepository;

  Future<Either<String, List<DoctorEnitity>>> call() async =>
      await _sharedRepository.getAllDoctors();
}
