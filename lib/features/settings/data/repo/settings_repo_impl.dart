import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/functions/upload_image.dart';
import 'package:doctor_hunt/features/settings/data/models/patient_model.dart';
import 'package:doctor_hunt/features/settings/data/repo/settings_repo.dart';

class SettingsRepoImpl implements SettingsRepo {
  final FirebaseFirestore _firebaseFirestore;

  SettingsRepoImpl({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore;
  @override
  Future<Either<String, PatientModel>> getCurrentPatient({
    required String patientId,
  }) async {
    try {
      final response = await _firebaseFirestore
          .collection("patients")
          .doc("patient_$patientId")
          .get();

      if (response.exists) {
        return right(PatientModel.fromJson(response.data()!, patientId));
      }

      return left("Patient not exist");
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> updateCurrentPatient({
    required PatientModel patient,
  }) async {
    try {
      String uploadedImage = '';
      if (patient.image != null) {
        uploadedImage = await uploadImage(patient.image!);
      }
      await _firebaseFirestore
          .collection("patients")
          .doc("patient_${patient.patientId}")
          .update({
            "phone": patient.phone,
            "name": patient.name,
            "imageUrl": patient.image == null
                ? patient.imageUrl
                : uploadedImage,
          });

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
