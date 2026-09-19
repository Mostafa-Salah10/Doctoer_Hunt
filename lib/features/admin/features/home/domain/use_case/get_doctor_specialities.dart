import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/enitites/docotor_speciality_entity.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/repo/admin_home_repo.dart';

class GetDoctorSpecialities {
  final AdminHomeRepo _adminHomeRepo;

  GetDoctorSpecialities({required AdminHomeRepo adminHomeRepo})
    : _adminHomeRepo = adminHomeRepo;

  Future<Either<String, List<DocotorSpecialityEntity>>> call() async =>
      await _adminHomeRepo.getDoctorSpecialities();
}
