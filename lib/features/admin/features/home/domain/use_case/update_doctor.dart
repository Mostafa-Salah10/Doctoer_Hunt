import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_enitity.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/repo/admin_home_repo.dart';

class UpdateDoctor {
  final AdminHomeRepo _adminHomeRepo;

  UpdateDoctor({required AdminHomeRepo adminHomeRepo})
    : _adminHomeRepo = adminHomeRepo;

  Future<Either<String, Null>> call({required DoctorEnitity doctor}) async =>
      await _adminHomeRepo.updateDoctor(doctor: doctor);
}
