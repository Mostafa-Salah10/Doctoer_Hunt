import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/enums/booking_status.dart';
import 'package:doctor_hunt/features/booking/data/models/doctor_available_day_model.dart';
import 'package:doctor_hunt/features/booking/data/models/slot_model.dart';
import 'package:doctor_hunt/features/booking/data/repo/booking_repo.dart';

class BookingRepoImpl implements BookingRepo {
  final FirebaseFirestore _firestore;

  BookingRepoImpl({required FirebaseFirestore firestore})
    : _firestore = firestore;

  @override
  Future<Either<String, List<DoctorAvailableDayModel>>>
  getAvailableDaysWithSlots({required String doctorId}) async {
    try {
      final daysResponse = await _getAvailableDays(doctorId);

      final days = await Future.wait(
        daysResponse.docs.map((dayDoc) async {
          final slotsResponse = await dayDoc.reference
              .collection('slots')
              .get();

          final slots = slotsResponse.docs
              .map(
                (slotDoc) => SlotModel.fromJson(slotDoc.data(), id: slotDoc.id),
              )
              .toList();

          final afternoonSlots = slots
              .where((slot) => slot.isAfternoon)
              .toList();

          final eveningSlots = slots
              .where((slot) => !slot.isAfternoon)
              .toList();

          return DoctorAvailableDayModel(
            availableDay: dayDoc.id,
            numberOfAvailableSlots: slots.length,
            afternoonSlots: afternoonSlots,
            eveningSlots: eveningSlots,
          );
        }),
      );

      return right(days);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _getAvailableDays(
    String doctorId,
  ) async {
    return await _firestore
        .collection('availablity')
        .doc(doctorId)
        .collection('days')
        .get();
  }

  @override
  Future<Either<String, Null>> bookWithDoctor({
    required String patientId,
    required String doctorId,
    required SlotModel slot,
    required String date,
  }) async {
    try {
      return await _firestore.runTransaction((transaction) async {
        final slotRef = _firestore
            .collection('availablity')
            .doc(doctorId)
            .collection('days')
            .doc(date)
            .collection('slots')
            .doc(slot.id);

        final slotSnapshot = await transaction.get(slotRef);

        if (slotSnapshot['isBooked']) {
          return left("Slot already booked");
        } else {
          transaction.update(slotRef, {"isBooked": true});
          final appointmentRef = _firestore.collection("appoinments").doc();
          transaction.set(appointmentRef, {
            "doctorId": doctorId,
            "patientId": patientId,
            "date": date,
            "slot": slot.id,
            "status": BookingStatus.upcoming.name,
          });

          return right(null);
        }
      });
    } catch (e) {
      return left(e.toString());
    }
  }
}

// await FirebaseFirestore.instance
//     .collection('availablity')
//     .doc(doctor.id)
//     .collection('days')
//     .doc('2026-10-06')
//     .collection('slots')
//     .doc('10:00 AM')
//     .set({'isBooked': false});
