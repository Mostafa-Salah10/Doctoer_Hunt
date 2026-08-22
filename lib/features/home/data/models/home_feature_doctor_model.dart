import 'package:doctor_hunt/core/utils/assets.dart';

class HomeFeatureDoctorModel {
  final String name;
  final String image;
  final double rate;
  final bool isFav;
  final double price;

  HomeFeatureDoctorModel({
    required this.name,
    required this.image,
    required this.rate,
    required this.isFav,
    required this.price,
  });


  static List<HomeFeatureDoctorModel> get doctors => [
    HomeFeatureDoctorModel(
      name: 'Dr. Crick',
      image: Assets.assetsImagesFeatureDocOne,
      rate: 3.7,
      isFav:false,
      price: 25.0,
    ),
    HomeFeatureDoctorModel(
      name: 'Dr. Strain',
      image: Assets.assetsImagesFeatureDocTwo,
      rate: 3.0,
      isFav:true,
      price: 22.0,
    ),
    HomeFeatureDoctorModel(
      name: 'Dr. Lachinet',
      image: Assets.assetsImagesFeatureDocThree,
      rate: 2.9,
      isFav:false,
      price: 29.0,
    ),

      HomeFeatureDoctorModel(
      name: 'Dr. Crick',
      image: Assets.assetsImagesFeatureDocOne,
      rate: 3.7,
      isFav:true,
      price: 25.0,
    ),
    
  ];
}
