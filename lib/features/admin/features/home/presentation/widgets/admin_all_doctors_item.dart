import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_enitity.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminAllDoctorsItem extends StatelessWidget {
  final DoctorEnitity doctor;

  const AdminAllDoctorsItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: CustomCachedNetworkImage(
              
              width: 69.w,
              height: 60.h,
              imageUrl: doctor.imageUrl),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: context.isDarkMode
                        ? AppColors.lightBackgroundColor
                        : AppColors.darkBackgroundColor,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(doctor.speciality, style: context.textTheme.titleSmall),

                SizedBox(height: 4.h),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    doctor.isActive ? "Active" : "Not Active",
                    style: context.textTheme.bodySmall!.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),

          InkWell(onTap: () {}, child: const Icon(Icons.more_vert)),
        ],
      ),
    );
  }
}
