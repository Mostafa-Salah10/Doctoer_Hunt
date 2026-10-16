import 'package:doctor_hunt/core/utils/assets.dart';

class OnboardingModel {
  final String title;
  final String subTitle;
  final String image;

  OnboardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  static List<OnboardingModel> get onboardingData => [
    OnboardingModel(
      image: Assets.assetsImagesOnboardingOne,
      title: "findTrustedDoctors",
      subTitle: "onboardingDescription",
    ),
    OnboardingModel(
      image: Assets.assetsImagesOnboardingTwo,
      title: "chooseBestDoctors",
      subTitle: "onboardingDescription",
    ),
    OnboardingModel(
      image: Assets.assetsImagesOnboardingThree,
      title: "easyAppointments",
      subTitle: "onboardingDescription",
    ),
  ];
}
