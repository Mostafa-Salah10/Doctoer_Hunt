import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';

abstract class AuthRepo {
  Future<Either<String, Null>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required Role role,
  });
  Future<Either<String, Role>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<String, Null>> resetPass({required String email});
}
