import 'package:doctor_hunt/core/utils/assets.dart';

class WhoPatientModel {
  final String image;
  final String title;

  WhoPatientModel({required this.image, required this.title});

  static List<WhoPatientModel> get patients => [
    WhoPatientModel(image: Assets.assetsImagesAddPatient, title: ""),
    WhoPatientModel(
      image: Assets.assetsImagesAppointmentBoyOne,
      title: "mySelf",
    ),
    WhoPatientModel(
      image: Assets.assetsImagesAppointmentBoyTwo,
      title: "myChild",
    ),
        WhoPatientModel(image: Assets.assetsImagesAppointmentBoyOne, title: "mySon"),

  ];
}
