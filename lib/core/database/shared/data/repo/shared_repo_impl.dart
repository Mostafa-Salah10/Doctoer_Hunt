import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/database/shared/data/data_source/shared_remote_data_source.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_enitity.dart';
import 'package:doctor_hunt/core/database/shared/domain/repo/shared_repository.dart';

class SharedRepoImpl extends SharedRepository {
  final SharedRemoteDataSource _sharedRemoteDataSource;

  SharedRepoImpl({required SharedRemoteDataSource sharedRemoteDataSource})
    : _sharedRemoteDataSource = sharedRemoteDataSource;
  @override
  Future<Either<String, List<DoctorEnitity>>> getAllDoctors() async {
    try {
      return Right(await _sharedRemoteDataSource.getDoctors());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
