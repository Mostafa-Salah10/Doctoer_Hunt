import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentShowSpecificDataCard extends StatelessWidget {
  const AppointmentShowSpecificDataCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.1),

            borderRadius: BorderRadius.circular(10),
          ),

          child: SvgPicture.asset(image, width: 20, height: 20),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 7,
          children: [
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              title,
              style: context.textTheme.bodySmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 11.sp,
              ),
            ),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              subTitle,
              style: context.textTheme.bodySmall!.copyWith(
                fontSize: 14.sp,

                color: context.isDarkMode
                    ? AppColors.lightBackgroundColor
                    : AppColors.darkBackgroundColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
