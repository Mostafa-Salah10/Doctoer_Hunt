import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/enums/booking_status.dart';
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

  @override
  Future<Either<String, Null>> cancelAppointment({
    required AppointmentModel appoitment,
  }) async {
    try {
      await _firebaseFirestore
          .collection('availablity')
          .doc(appoitment.doctorId)
          .collection('days')
          .doc(appoitment.date)
          .collection('slots')
          .doc(appoitment.slot)
          .update({'isBooked': false});

      await _firebaseFirestore
          .collection("appoinments")
          .doc(appoitment.bookingId)
          .update({'status': BookingStatus.cancelled.name});

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> rateDoctor({
    required String doctorId,
    required String patientId,
    required String appointmentId,
    required int rate,
  }) async {
    try {
      final ratingRef = _firebaseFirestore
          .collection('doctorRatings')
          .doc(appointmentId);

      await ratingRef.set({
        'doctorId': doctorId,
        'patientId': patientId,
        'appointmentId': appointmentId,
        'rating': rate,
      });

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
