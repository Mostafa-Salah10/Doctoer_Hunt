import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFields extends StatelessWidget {
  const ProfileFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal information',
            style: context.textTheme.titleMedium!.copyWith(
              color: context.isDarkMode
                  ? AppColors.lightBackgroundColor
                  : AppColors.darkBackgroundColor,
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
