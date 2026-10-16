import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/admin/features/settings/data/models/admin_model.dart';

abstract class AdminSettingsRepo {
  Future<Either<String, AdminModel>> getCurrentAdmin({required String adminId});
  Future<Either<String, Null>> updateCurrentAdmin({required AdminModel admin});
}
