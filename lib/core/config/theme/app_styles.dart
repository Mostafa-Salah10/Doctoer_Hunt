import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static final TextStyle font28DarkTextMedium = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.darkTextColor,
    letterSpacing: -0.3.sp,
    height: 1,
  );
  static final TextStyle font14GreyTextregular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.greyTextColor,
    letterSpacing: -0.3.sp,
    height: 1.6,
  );
  static final TextStyle font18WhiteTextMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lightBackgroundColor,
    height: 1,
  );
}
