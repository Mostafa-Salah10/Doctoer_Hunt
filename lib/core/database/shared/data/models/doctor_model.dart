import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  DoctorModel({
    required super.name,
    required super.imageUrl,
    required super.isActive,
    required super.speciality,
    required super.id,
  });

  factory DoctorModel.fromJson(
    Map<String, dynamic> json, {
    required String id,
  }) {
    return DoctorModel(
      id: id,
      name: json['name'] as String,
      imageUrl: json['image'] as String,
      isActive: json['isActive'] as bool,
      speciality: json['speciality'] as String,
    );
  }
}
