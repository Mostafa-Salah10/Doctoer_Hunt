import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentPatientDoctorCard extends StatelessWidget {
  const AppointmentPatientDoctorCard({
    super.key,
    this.isDoctor = false,
    required this.image,
    required this.subTitle,
    required this.title,
  });

  final bool isDoctor;

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Text(
          isDoctor ? "Doctor" : "Patient",
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.isDarkMode
                ? AppColors.lightBackgroundColor
                : AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
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
                width: isDoctor ? 55.w : 64.w,
                height: isDoctor ? 55.w : 64.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CustomCachedNetworkImage(imageUrl: image),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleMedium!.copyWith(
                        color: context.isDarkMode
                            ? AppColors.lightBackgroundColor
                            : AppColors.darkTextColor,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    !isDoctor
                        ? Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: AppColors.greyColor,
                                size: 23,
                              ),
                              SizedBox(width: 6.w),
                              Expanded(
                                child: Text(
                                  subTitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textTheme.titleSmall!.copyWith(
                                    color: AppColors.greyColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Text(
                            subTitle,
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
              if (isDoctor) ...[
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor.withValues(alpha: 0.1),
                  ),

                  child: Icon(
                    Icons.verified,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
