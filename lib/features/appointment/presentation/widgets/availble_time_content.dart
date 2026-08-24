import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/data/models/available_time_model.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/available_time_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvialableTimeContent extends StatelessWidget {
  const AvialableTimeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available Time",
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.isDarkMode
                ? AppColors.lightBackgroundColor
                : AppColors.darkBackgroundColor,

            fontWeight: FontWeight.w500,
          ),
        ),
        Flexible(child: const VerticalSpace(height: 30)),
        AvailableTimeList(availableTimeList: AvailableTimeModel.times),
        Flexible(child: const VerticalSpace(height: 30)),
        Text(
          "Available Time",
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.isDarkMode
                ? AppColors.lightBackgroundColor
                : AppColors.darkBackgroundColor,

            fontWeight: FontWeight.w500,
          ),
        ),
        Flexible(child: const VerticalSpace(height: 30)),

        AvailableTimeList(availableTimeList: AvailableTimeModel.minutes),
        Flexible(child: const VerticalSpace(height: 30)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: AppButton(text: "Confirm", onPressed: () {}),
        ),
      ],
    );
  }
}
