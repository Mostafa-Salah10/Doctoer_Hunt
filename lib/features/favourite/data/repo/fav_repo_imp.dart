import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/database/shared/data/models/doctor_model.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/functions/get_patient_id.dart';
import 'package:doctor_hunt/features/favourite/data/repo/fav_repo.dart';

class FavRepoImp implements FavRepo {
  final FirebaseFirestore _firebaseFirestore;

  FavRepoImp({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore;
  @override
  Future<Either<String, Null>> addToFav({required String doctorId}) async {
    try {
      await _firebaseFirestore
          .collection('favourites')
          .doc(getPatientId())
          .collection('doctors')
          .doc(doctorId)
          .set({'id': doctorId});

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Set<String>>> getFavDoctorsIds() async {
    try {
      final response = await _firebaseFirestore
          .collection('favourites')
          .doc(getPatientId())
          .collection('doctors')
          .get();

      final Set<String> doctorsIds = {for (final doc in response.docs) doc.id};

      return right(doctorsIds);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> removeFromFav({required String doctorId}) async {
    try {
      await _firebaseFirestore
          .collection('favourites')
          .doc(getPatientId())
          .collection('doctors')
          .doc(doctorId)
          .delete();

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<DoctorEntity>>> getFavDoctors() async {
    try {
      final result = await getFavDoctorsIds();

      return await result.fold(
        (error) async {
          return left(error);
        },
        (favIds) async {
          final response = await _firebaseFirestore.collection('doctors').get();

          final List<DoctorEntity> doctors = [];

          for (var doctor in response.docs) {
            if (favIds.contains(doctor.id)) {
              doctors.add(DoctorModel.fromJson(doctor.data(), id: doctor.id));
            }
          }

          return right(doctors);
        },
      );
    } catch (e) {
      return left(e.toString());
    }
  }
}
