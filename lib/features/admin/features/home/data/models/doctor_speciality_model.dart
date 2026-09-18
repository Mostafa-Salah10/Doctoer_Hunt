import 'package:doctor_hunt/features/admin/features/home/domain/enitites/docotor_speciality_entity.dart';

class DoctorSpecialityModel extends DocotorSpecialityEntity {
  DoctorSpecialityModel({
    required super.speciality,
    required super.specialityId,
  });

  factory DoctorSpecialityModel.fromJson({
    required String specialityId,
    required Map<String, dynamic> json,
  }) {
    return DoctorSpecialityModel(
      speciality: json['speciality'],
      specialityId: specialityId,
    );
  }
}
