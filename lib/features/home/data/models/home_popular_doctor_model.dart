import 'package:doctor_hunt/core/utils/assets.dart';

class HomePopularDoctorModel {
  final String name;
  final String image;
  final int rate;
  final String speciality;
  HomePopularDoctorModel({
    required this.name,
    required this.image,
    required this.rate,
    required this.speciality,
  });

  static List<HomePopularDoctorModel> get popularDoctors => [
    HomePopularDoctorModel(
      name: "Dr. Fillerup Grab",
      image: Assets.assetsImagesPopularDocOne,
      rate: 4,
      speciality: "Medicine Specialist",
    ),
    HomePopularDoctorModel(
      name: "Dr. Blessing",
      image: Assets.assetsImagesPopularDocTwo,
      rate: 4,
      speciality: "Dentist Specialist",
    ),
  ];
}
