import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';
import 'package:doctor_hunt/features/appointment/data/repo/appointment_repo.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final FirebaseFirestore _firebaseFirestore;

  AppointmentRepoImpl({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore;

  @override
  Future<Either<String, List<AppointmentModel>>> getPatientAppointment({
    required String patientId,
  }) async {
    try {
      final response = await _firebaseFirestore
          .collection('appoinments')
          .where("patientId", isEqualTo: patientId)
          .get();

      return right([
        ...response.docs.map(
          (doc) => AppointmentModel.fromJson(doc.data(), bookingId: doc.id),
        ),
      ]);
    } catch (e) {
      return left(e.toString());
    }
  }
}
