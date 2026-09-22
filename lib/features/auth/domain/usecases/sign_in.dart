import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/features/auth/domain/repo/auth_repo.dart';

class SignIn {
  final AuthRepo _authRepo;

  SignIn({required AuthRepo authRepo}) : _authRepo = authRepo;
  Future<Either<String, Role>> call({
    required String email,
    required String password,
  }) async {
    return await _authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
