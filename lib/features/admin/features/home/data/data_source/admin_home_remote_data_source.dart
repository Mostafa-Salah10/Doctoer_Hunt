import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/features/admin/features/home/data/models/doctor_speciality_model.dart';

class AdminHomeRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  AdminHomeRemoteDataSource({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore;

  Future<List<DoctorSpecialityModel>> getSpecialities() async {
    final response = await _firebaseFirestore.collection('specialities').get();

    final List<DoctorSpecialityModel> specialities = [];

    for (var speciality in response.docs) {
      specialities.add(
        DoctorSpecialityModel.fromJson(
          specialityId: speciality.id,
          json: speciality.data(),
        ),
      );
    }

    return specialities;
  }
}
