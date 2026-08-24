import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/size_extension.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/availble_time_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailbaleTimeWidget extends StatelessWidget {
  const AvailbaleTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: context.height * 0.4),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),

      decoration: BoxDecoration(
        color: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45.r),
          topRight: Radius.circular(45.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.06),
            blurRadius: 25.r,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),

      child: const AvialableTimeContent(),
    );
  }
}
