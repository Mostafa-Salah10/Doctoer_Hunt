import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/helpers/date_time_helper.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/models/doctor_working_day_model.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/repo/doctor_availability_repo.dart';

class DoctorAvailabilityRepoImpl implements DoctorAvailabilityRepo {
  final FirebaseFirestore _firebaseFirestore;

  DoctorAvailabilityRepoImpl({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore;

  @override
  Future<Either<String, DoctorAvailabilityModel>> getWorkingDays({
    required String doctorId,
  }) async {
    try {
      final response = await _firebaseFirestore
          .collection('doctor_availability')
          .doc(doctorId)
          .get();

      if (!response.exists) {
        return right(DoctorAvailabilityModel.defaultData());
      }

      return right(DoctorAvailabilityModel.fromJson(response.data()!));
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, DoctorAvailabilityModel>> updateWorkingDays({
    required String doctorId,
    required DoctorAvailabilityModel availability,
  }) async {
    try {
      await _firebaseFirestore
          .collection('doctor_availability')
          .doc(doctorId)
          .set({
            'weeklySettings': {
              for (final day in availability.workingDays)
                day.weekday.name.toLowerCase(): day.isActive,
            },
            'startTime': DateTimeHelper.formateTimeToAMAndPM(
              availability.startTime,
            ),
            'endTime': DateTimeHelper.formateTimeToAMAndPM(
              availability.endTime,
            ),
            'slotDuration': availability.slotDuration,
            'firstSet': false,
          }, SetOptions(merge: true));

      return right(availability);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> addSlot({
    required String doctorId,
    required String date,
    required String startTime,
    required String endTime,
  }) async {
    try {
      final dayRef = _firebaseFirestore
          .collection('availablity')
          .doc(doctorId)
          .collection('days')
          .doc(date);

      await dayRef.set({});

      await dayRef.collection('slots').doc(startTime).set({'isBooked': false});

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
