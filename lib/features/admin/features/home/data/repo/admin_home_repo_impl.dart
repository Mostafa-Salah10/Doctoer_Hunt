import 'package:dartz/dartz.dart';
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
}
