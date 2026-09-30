import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsMap extends StatelessWidget {
  const DoctorDetailsMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 190.h,
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? AppColors.darkblackText
            : AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(10),
    
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            offset: Offset(0, 0),
            spreadRadius: 0,
            color: AppColors.blackColor.withValues(alpha: 0.08),
          ),
        ],
      ),
    
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Image.asset(Assets.assetsImagesMap, fit: BoxFit.cover),
      ),
    );
  }
}