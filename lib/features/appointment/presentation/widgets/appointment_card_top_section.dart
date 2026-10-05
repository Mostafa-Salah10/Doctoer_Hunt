import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppinmentTopSection extends StatelessWidget {
  const AppinmentTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: 84.w,
          height: 84.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          // child: CustomCachedNetworkImage(imageUrl: doctor.imageUrl),

          child: Image.asset(Assets.assetsImagesAppointment),
        ),

        Expanded(
          child: Column(
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                "Dr. Ananya Shah",
                style: context.textTheme.bodyLarge!.copyWith(
                  color: context.isDarkMode
                      ? AppColors.lightBackgroundColor
                      : AppColors.darkTextColor,
                ),
              ),

              const VerticalSpace(height: 5),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                'Specialist Cardiologist',
                style: context.textTheme.bodySmall!.copyWith(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: AppColors.primaryColor.withValues(alpha: 0.1),
          ),

          child: Row(
            spacing: 7,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              Text("Upcoming", style: context.textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}
