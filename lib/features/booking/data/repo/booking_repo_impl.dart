
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
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

      // log("Available days found: ${daysResponse.docs.length}");

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
}
