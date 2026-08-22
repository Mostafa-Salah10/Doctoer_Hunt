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
    fontFamily: "Rubik",
  );
  static final TextStyle font14GreyTextregular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.greyTextColor,
    letterSpacing: -0.3.sp,
    height: 1.6,
    fontFamily: "Rubik",
  );
  static final TextStyle font18WhiteTextMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lightBackgroundColor,
    height: 1,
    fontFamily: "Rubik",
  );
  static final TextStyle font25BlackTextBold = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.blackTextColor,
    height: 1,
    letterSpacing: -0.3.sp,
    fontFamily: "Rubik",
  );

  static final TextStyle font28darkblackTextRegularPlusJakarta = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.darkblackText,
    letterSpacing: 0.sp,
    height: 42 / 28,
    fontFamily: "PlusJakartaSans",
  );
  static final TextStyle font20darkblackTextSemiBoldPlusJakarta = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.darkblackText,
    letterSpacing: 0.sp,
    height: 28 / 20,
    fontFamily: "PlusJakartaSans",
  );
  static final TextStyle font20lightTextColorregularRubik = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightTextColor,
    letterSpacing: -0.3.sp,
    height:1,
    fontFamily: "Rubik",
  );
  static final TextStyle font24BlackMeduimRubik = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
    letterSpacing: -0.3.sp,
    height: 1,
    fontFamily: "Rubik",
  );
  static final TextStyle font16GreyTextLight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.greyTextColor,
    letterSpacing: -0.3.sp,
    height: 1,
    fontFamily: "Rubik",
  );
}
