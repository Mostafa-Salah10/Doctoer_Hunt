import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:doctor_hunt/features/admin/features/home/data/models/doctor_speciality_model.dart';

class AdminHomeRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  AdminHomeRemoteDataSource({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

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

  Future<String> _uploadImage(File image) async {
    const cloudName = 'o4xihtao';
    const uploadPreset = 'bvlaal3a';

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
      'upload_preset': uploadPreset,
    });

    final response = await Dio().post(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
      data: formData,
    );

    return response.data['secure_url'];
  }

  Future<void> createDoctor({
    required String name,
    required String speciality,
    required File image,
  }) async {
    final imageUrl = await _uploadImage(image);

    await _firebaseFirestore.collection('doctors').add({
      'name': name,
      'speciality': speciality,
      'image': imageUrl,
    });
  }
}
