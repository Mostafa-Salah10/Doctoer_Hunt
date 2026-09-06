import 'package:doctor_hunt/core/utils/assets.dart';

class AdminDoctorModel {
  final String name;
  final String specialty;
  final String status;
  final String image;

  const AdminDoctorModel({
    required this.name,
    required this.specialty,
    required this.status,
    required this.image,
  });

  static const List<AdminDoctorModel> dummyDoctors = [
    AdminDoctorModel(
      name: 'Dr Ahmed Ali',
      specialty: 'Cardiologist',
      status: 'Active',
      image: Assets.assetsImagesFavDocOne,
    ),
    AdminDoctorModel(
      name: 'Dr Mohamed Hassan',
      specialty: 'Dermatologist',
      status: 'Active',
      image: Assets.assetsImagesFavDocOne,
    ),
    AdminDoctorModel(
      name: 'Dr Omar Ahmed',
      specialty: 'Neurologist',
      status: 'Inactive',
      image: Assets.assetsImagesFavDocOne,
    ),
    AdminDoctorModel(
      name: 'Dr Youssef Ali',
      specialty: 'Dentist',
      status: 'Active',
      image: Assets.assetsImagesFavDocOne,
    ),
  ];
}
