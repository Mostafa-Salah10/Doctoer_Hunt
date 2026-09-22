import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:doctor_hunt/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl({required AuthRemoteDataSource authRemoteDataSource})
    : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<Either<String, Role>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final role = await _authRemoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(role);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required Role role,
  }) async {
    try {
      await _authRemoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
        role: role,
      );

      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> resetPass({required String email}) async {
    try {
      await _authRemoteDataSource.resetPass(email: email);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
