import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDayListItem extends StatelessWidget {
  const SelectDayListItem({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : null,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 2,
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.greyTextColor.withValues(alpha: .1),
        ),
      ),

      child: Column(
        spacing: 4.h,
        children: [
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            "Today, 23 Feb",
            style: context.textTheme.bodyLarge!.copyWith(
              color: isSelected
                  ? AppColors.lightBackgroundColor
                  : AppColors.blackColor,
            ),
          ),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            "No slots available",
            style: context.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: isSelected
                  ? AppColors.lightBackgroundColor
                  : AppColors.greyTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
