import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:flutter/material.dart';

class HomeCategoryModel {
  final String icon;
  final Color linearOne;
  final Color linearTwo;

  HomeCategoryModel({
    required this.icon,
    required this.linearOne,
    required this.linearTwo,
  });

  static List<HomeCategoryModel> get categories => [
    HomeCategoryModel(
      icon: Assets.assetsSvgsTeeth,
      linearOne: AppColors.blueLinearOne,
      linearTwo: AppColors.blueLinearTwo,
    ),
    HomeCategoryModel(
      icon: Assets.assetsSvgsHeart,
      linearOne: AppColors.primaryColorLinearOne,
      linearTwo: AppColors.primaryColorLinearTwo,
    ),
    HomeCategoryModel(
      icon: Assets.assetsSvgsEye,
      linearOne: AppColors.orangeLinearOne,
      linearTwo: AppColors.orangeLinearTwo,
    ),
    HomeCategoryModel(
      icon: Assets.assetsSvgsClothes,
      linearOne: AppColors.redLinearOne,
      linearTwo: AppColors.redLinearTwo,
    ),
  ];
}
