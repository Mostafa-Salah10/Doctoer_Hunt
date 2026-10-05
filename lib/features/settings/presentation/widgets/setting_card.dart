import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
      ),

      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 66.w,
            height: 66.w,
            decoration: BoxDecoration(shape: BoxShape.circle),
            // child: CustomCachedNetworkImage(imageUrl: doctor.imageUrl),

            child: Image.asset(Assets.assetsImagesAppointment),
          ),

          const HorizontalSpace(width: 16),

          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Patient User",
                style: context.textTheme.bodyLarge!.copyWith(
                  color: context.isDarkMode
                      ? AppColors.lightBackgroundColor
                      : AppColors.darkblackText,
                ),
              ),
              Text(
                "mostafa@gmail.com",
                style: context.textTheme.bodySmall!.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
