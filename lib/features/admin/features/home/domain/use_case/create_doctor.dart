import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/repo/admin_home_repo.dart';

class CreateDoctor {
  final AdminHomeRepo _adminHomeRepo;

  CreateDoctor({required AdminHomeRepo adminHomeRepo})
    : _adminHomeRepo = adminHomeRepo;

  Future<Either<String, Null>> call({
    required String name,
    required String speciality,
    required File image,
  }) async => await _adminHomeRepo.createDoctor(
    image: image,
    name: name,
    speciality: speciality,
  );
}
