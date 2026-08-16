import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnboardingLinearCircle extends StatelessWidget {
  const CustomOnboardingLinearCircle({super.key, required this.isSecondPage});
  final bool isSecondPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20.h,
      left: isSecondPage ? null : -104.w,
      right: isSecondPage ? -104.w : null,
      child: Container(
        width: 342.w,
        height: 342.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColorLinearOne,
              AppColors.primaryColorLinearTwo,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}