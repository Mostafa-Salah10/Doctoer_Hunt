import 'package:doctor_hunt/core/utils/assets.dart';

class DoctorFavModel {
  final String name;
  final bool isFav;
  final String image;
  final String speciality;

  DoctorFavModel({
    required this.name,
    required this.isFav,
    required this.image,
    required this.speciality,
  });

  static List<DoctorFavModel> get doctors => [
    DoctorFavModel(
      image: Assets.assetsImagesFavDocOne,
      isFav: false,
      name: 'Dr Shouey',
      speciality: 'specialistCardiology',
    ),
    DoctorFavModel(
      image: Assets.assetsImagesPopularDocOne,
      isFav: true,
      name: 'Dr Christen feldN',
      speciality: 'specialistCancer',
    ),
    DoctorFavModel(
      image: Assets.assetsImagesFavDocThree,
      isFav: true,
      name: 'Dr Shouey',
      speciality: 'specialistMedicine',
    ),
    DoctorFavModel(
      image: Assets.assetsImagesFeatureDocThree,
      isFav: false,
      name: 'Dr Shouey',
      speciality: 'specialistDentist',
    ),
  ];
}
