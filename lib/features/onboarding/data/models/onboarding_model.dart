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
      title: "Find Trusted Doctors",
      subTitle:
          "Contrary to popular belief, Lorem Ipsum is not\n simply random text. It has roots in a piece of it\n over 2000 years old.",
    ),
    OnboardingModel(
      image: Assets.assetsImagesOnboardingTwo,
      title: "Choose Best Doctors",
      subTitle:
          "Contrary to popular belief, Lorem Ipsum is not\n simply random text. It has roots in a piece of it\n over 2000 years old.",
    ),
    OnboardingModel(
      image: Assets.assetsImagesOnboardingThree,
      title: "Easy Appointments",
      subTitle:
          "Contrary to popular belief, Lorem Ipsum is not\n simply random text. It has roots in a piece of it\n over 2000 years old.",
    ),
  ];
}
