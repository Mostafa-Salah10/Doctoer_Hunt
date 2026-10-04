import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectTimeDataItem extends StatelessWidget {
  const SelectTimeDataItem({
    super.key,
    required this.isSelected,
    required this.index,
  });

  final bool isSelected;

  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 76.w,
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryColor
            : AppColors.primaryColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 2,
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.greyTextColor.withValues(alpha: .1),
        ),
      ),

      child: Text(
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        "$index:00 PM",
        style: context.textTheme.bodyMedium!.copyWith(
          color: isSelected
              ? AppColors.lightBackgroundColor
              : AppColors.primaryColor,
        ),
      ),
    );
  }
}
