import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/core/database/shared/data/models/doctor_model.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_enitity.dart';

class SharedRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  SharedRemoteDataSource({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore;

  Future<List<DoctorEnitity>> getDoctors() async {
    // throw Exception('Disha');
    final response = await _firebaseFirestore.collection('doctors').get();

    final List<DoctorEnitity> doctors = [];

    for (var doctor in response.docs) {
      doctors.add(DoctorModel.fromJson(doctor.data(), id: doctor.id));
    }

    return doctors;
  }
}
