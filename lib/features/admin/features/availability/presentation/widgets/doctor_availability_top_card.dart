import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorAvailabilityTopCard extends StatelessWidget {
  const DoctorAvailabilityTopCard({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            spreadRadius: 0,
            blurRadius: 10,
            color: AppColors.blackColor.withValues(alpha: 0.051),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: CustomCachedNetworkImage(imageUrl: doctor.imageUrl),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  doctor.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleMedium!.copyWith(
                    color: context.isDarkMode
                        ? AppColors.lightBackgroundColor
                        : AppColors.darkTextColor,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "${doctor.speciality}.centeral clinic",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall!.copyWith(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),
          SvgPicture.asset(
            height: 25,
            doctor.isActive
                ? Assets.assetsSvgsActiveDoctor
                : Assets.assetsSvgsInactiveDoctor,
          ),
        ],
      ),
    );
  }
}
