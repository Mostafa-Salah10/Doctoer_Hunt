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
        spacing: 13,
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

          ProfileDataField(title: "Name", value: "Mostafa Salah"),
          ProfileDataField(title: "Contact Number", value: "01006828614"),
        ],
      ),
    );
  }
}

class ProfileDataField extends StatelessWidget {
  const ProfileDataField({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),

      decoration: BoxDecoration(
        color: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightTextColor,

        borderRadius: BorderRadius.circular(12),

        
      ),

      child: Row(
        spacing: 13,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 7,
              children: [
                Text(title, style: context.textTheme.bodySmall),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  value,
                  style: context.textTheme.bodyLarge,
                ),
              ],
            ),
          ),

          Icon(Icons.edit, color: AppColors.greyTextColor, size: 20),
        ],
      ),
    );
  }
}
