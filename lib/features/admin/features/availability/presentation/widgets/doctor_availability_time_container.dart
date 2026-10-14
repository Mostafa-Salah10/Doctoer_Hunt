import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorAvailabilityTimeContainer extends StatelessWidget {
  const DoctorAvailabilityTimeContainer({
    super.key,
    required this.title,
    required this.time,
    required this.onTap,
  });

  final String title;
  final String time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          title,
          style: context.textTheme.bodySmall!.copyWith(
            color: AppColors.doctorGreyColor,
          ),
        ),

        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(8),
          ),

          child: InkWell(
            onTap: onTap,
            child: Row(
              spacing: 10.w,
              children: [
                SvgPicture.asset(Assets.assetsSvgsClock, width: 16),
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      time,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_outlined),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
