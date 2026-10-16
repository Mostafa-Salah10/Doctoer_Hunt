import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/functions/upload_image.dart';
import 'package:doctor_hunt/features/admin/features/settings/data/models/admin_model.dart';
import 'package:doctor_hunt/features/admin/features/settings/data/repo/admin_settings_repo.dart';

class AdminSettingsRepoImpl implements AdminSettingsRepo {
  final FirebaseFirestore _firebaseFirestore;

  AdminSettingsRepoImpl({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore;
  @override
  Future<Either<String, AdminModel>> getCurrentAdmin({
    required String adminId,
  }) async {
    try {
      final response = await _firebaseFirestore
          .collection("admin")
          .doc("user_$adminId")
          .get();

      if (response.exists) {
        return right(AdminModel.fromJson(response.data()!, adminId));
      }

          log("Admin not exist");


      return left("Admin not exist");
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> updateCurrentAdmin({
    required AdminModel admin,
  }) async {
    try {
      String uploadedImage = '';
      if (admin.image != null) {
        uploadedImage = await uploadImage(admin.image!);
      }
      await _firebaseFirestore
          .collection("admin")
          .doc("user_${admin.adminId}")
          .update({
            "name": admin.name,
            "imageUrl": admin.image == null ? admin.imageUrl : uploadedImage,
          });

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
