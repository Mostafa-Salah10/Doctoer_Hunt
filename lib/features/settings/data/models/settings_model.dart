import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/utils/assets.dart';

class SettingsModel {
  final String image;
  final String targetRoute;
  final String title;

  SettingsModel({
    required this.image,
    required this.targetRoute,
    required this.title,
  });

  static List<SettingsModel> get settingsData => [
    SettingsModel(
      image: Assets.assetsImagesSettingsLock,
      targetRoute: '',
      title: 'Change Password',
    ),
    SettingsModel(
      image: Assets.assetsImagesSettingsNotification,
      targetRoute: '',
      title: 'Notifications',
    ),
    SettingsModel(
      image: Assets.assetsImagesSettingsPrivacy,
      targetRoute: AppRoutes.privacyPolicyScreen,
      title: 'Privacy Policy',
    ),
  ];
}
