import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/auth/domain/repo/auth_repo.dart';

class ResetPass {
  final AuthRepo _authRepo;

  ResetPass({required AuthRepo authRepo}) : _authRepo = authRepo;
  Future<Either<String, Null>> call({required String email}) async {
    return await _authRepo.resetPass(email: email);
  }
}
