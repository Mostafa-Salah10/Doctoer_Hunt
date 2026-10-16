import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/settings/data/models/patient_model.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({super.key, this.patient});

  final PatientModel? patient;

  @override
  Widget build(BuildContext context) {
    final isLoading = patient == null;

    return Skeletonizer(
      enabled: isLoading,
      child: Container(
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
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: isLoading
                  ? const Bone.circle(size: 66)
                  : CustomCachedNetworkImage(imageUrl: patient!.imageUrl),
            ),
            const HorizontalSpace(width: 16),
            Expanded(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient?.name ?? context.t.patientUser,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: context.isDarkMode
                          ? AppColors.lightBackgroundColor
                          : AppColors.darkblackText,
                    ),
                  ),
                  Text(
                    patient?.email ?? 'mostafa@gmail.com',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
