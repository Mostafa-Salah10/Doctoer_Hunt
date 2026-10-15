import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/settings/data/models/patient_model.dart';

abstract class SettingsRepo {
  Future<Either<String, PatientModel>> getCurrentPatient({
    required String patientId,
  });
  Future<Either<String, Null>> updateCurrentPatient({
    required PatientModel patient,
  });
}
