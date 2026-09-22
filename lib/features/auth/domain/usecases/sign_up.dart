import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/features/auth/domain/repo/auth_repo.dart';

class SignUp {
  final AuthRepo _authRepo;

  SignUp({required AuthRepo authRepo}) : _authRepo = authRepo;
  Future<Either<String, Null>> call({
    required String email,
    required String password,
    required String name,
    required Role role,
  }) async {
    return await _authRepo.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      role: role,
    );
  }
}
