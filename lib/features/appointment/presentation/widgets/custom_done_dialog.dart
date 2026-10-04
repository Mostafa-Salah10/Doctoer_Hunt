import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/size_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDoneDialog extends StatelessWidget {
  const CustomDoneDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(maxWidth: 400.w, maxHeight: 530.h),
        padding: EdgeInsets.symmetric(vertical: 26.w, horizontal: 33.h),

        width: context.width * 0.9,

        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.darkBackgroundColor
              : AppColors.lightBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 156.w,
              height: 156.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.2),

                shape: BoxShape.circle,
              ),

              child: Center(
                child: Image.asset(
                  Assets.assetsImagesLike,
                  width: 72.w,
                  height: 69.h,
                ),
              ),
            ),
            const VerticalSpace(height: 12),
            Text('Thank You !', style: context.textTheme.displaySmall),
            const VerticalSpace(height: 10),
            Text(
              'Your Appointment Successful',
              textAlign: TextAlign.center,

              style: context.textTheme.titleMedium!.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),

            const VerticalSpace(height: 29),

            Text(
              'You booked an appointment with Dr. Pediatrician Purpieson on February 21, at 02:00 PM',
              textAlign: TextAlign.center,

              style: context.textTheme.titleSmall,
            ),

            const VerticalSpace(height: 29),

            AppButton(text: "Done", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
