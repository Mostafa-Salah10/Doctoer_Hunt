import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/enums/doctor_speciality.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:flutter/material.dart';

class HomeCategoryModel {
  final String icon;
  final Color linearOne;
  final Color linearTwo;
  final DoctorSpeciality doctorSpeciality;

  HomeCategoryModel({
    required this.icon,
    required this.linearOne,
    required this.linearTwo,
    required this.doctorSpeciality,
  });

  static List<HomeCategoryModel> get categories => [
    HomeCategoryModel(
      doctorSpeciality: DoctorSpeciality.dentistry,
      icon: Assets.assetsSvgsTeeth,
      linearOne: AppColors.blueLinearOne,
      linearTwo: AppColors.blueLinearTwo,
    ),
    HomeCategoryModel(
      doctorSpeciality: DoctorSpeciality.cardiology,

      icon: Assets.assetsSvgsHeart,
      linearOne: AppColors.primaryColorLinearOne,
      linearTwo: AppColors.primaryColorLinearTwo,
    ),
    HomeCategoryModel(
      doctorSpeciality: DoctorSpeciality.ophthalmology,

      icon: Assets.assetsSvgsEye,
      linearOne: AppColors.orangeLinearOne,
      linearTwo: AppColors.orangeLinearTwo,
    ),
    HomeCategoryModel(
      doctorSpeciality: DoctorSpeciality.internalMedicine,

      icon: Assets.assetsSvgsClothes,
      linearOne: AppColors.redLinearOne,
      linearTwo: AppColors.redLinearTwo,
    ),
  ];
}
