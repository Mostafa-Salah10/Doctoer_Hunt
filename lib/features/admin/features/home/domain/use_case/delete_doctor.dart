import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/repo/admin_home_repo.dart';

class DeleteDoctor {
  final AdminHomeRepo _adminHomeRepo;

  DeleteDoctor({required AdminHomeRepo adminHomeRepo})
    : _adminHomeRepo = adminHomeRepo;

  Future<Either<String, Null>> call({required String doctorId}) async =>
      await _adminHomeRepo.deleteDoctor(doctorId: doctorId);
}
