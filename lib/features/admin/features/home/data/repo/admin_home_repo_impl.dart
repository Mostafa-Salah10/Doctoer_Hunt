import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/features/admin/features/home/data/data_source/admin_home_remote_data_source.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/enitites/docotor_speciality_entity.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/repo/admin_home_repo.dart';

class AdminHomeRepoImpl extends AdminHomeRepo {
  final AdminHomeRemoteDataSource _adminHomeRemoteDataSource;

  AdminHomeRepoImpl({
    required AdminHomeRemoteDataSource adminHomeRemoteDataSource,
  }) : _adminHomeRemoteDataSource = adminHomeRemoteDataSource;
  @override
  Future<Either<String, List<DocotorSpecialityEntity>>>
  getDoctorSpecialities() async {
    try {
      return Right(await _adminHomeRemoteDataSource.getSpecialities());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> createDoctor({
    required String name,
    required String speciality,
    required File image,
  }) async {
    try {
      await _adminHomeRemoteDataSource.createDoctor(
        image: image,
        name: name,
        speciality: speciality,
      );

      return right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> deleteDoctor({required String doctorId}) async {
    try {
      await _adminHomeRemoteDataSource.deleteDoctor(doctorId: doctorId);

      return right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> updateDoctor({
    required DoctorEntity doctor,
  }) async {
    try {
      await _adminHomeRemoteDataSource.updateDotor(doctor: doctor);

      return right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
