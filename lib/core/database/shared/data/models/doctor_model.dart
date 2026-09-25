import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  DoctorModel({
    required super.name,
    required super.imageUrl,
    required super.isActive,
    required super.speciality,
    required super.id,
    super.cost,
    super.imageFile,
    super.rating,

    super.isFeature,
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
      cost: json['cost'] as double,
      isFeature: json['isFeature'] as bool,
      rating: json['rating'] as double,
    );
  }
}
