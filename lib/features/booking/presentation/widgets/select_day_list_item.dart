import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/helpers/date_time_helper.dart';
import 'package:doctor_hunt/core/helpers/string_helper.dart';
import 'package:doctor_hunt/features/booking/data/models/doctor_available_day_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDayListItem extends StatelessWidget {
  const SelectDayListItem({
    super.key,
    required this.isSelected,
    required this.day,
  });

  final bool isSelected;
  final DoctorAvailableDayModel day;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.all(11.w),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : null,
        borderRadius: BorderRadius.circular(6.r),
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
            DateTimeHelper.formatDate(day.availableDay),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyLarge!.copyWith(
              color: isSelected
                  ? AppColors.lightBackgroundColor
                  : AppColors.blackColor,
            ),
          ),
          Text(
            StringHelper.formatAvailableSlots(day.numberOfAvailableSlots),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
