import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/data/models/home_feature_doctor_model.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentDoctorCard extends StatelessWidget {
  const AppointmentDoctorCard({super.key, required this.doctor});

  final HomeFeatureDoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: context.isDarkMode
                ? AppColors.darkBackgroundColor
                : AppColors.blackColor.withValues(alpha: 0.25),
            blurRadius: 20.r,
            offset: Offset(0, 0),
          ),
        ],
      ),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              Assets.assetsImagesAppointment,
              width: 92.w,
              height: 87.w,
              fit: BoxFit.cover,
            ),
          ),

          const HorizontalSpace(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 5.w,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      doctor.name,
                      style: context.textTheme.titleMedium!.copyWith(
                        color: context.isDarkMode
                            ? AppColors.lightBackgroundColor
                            : AppColors.darkTextColor,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        doctor.isFav
                            ? Assets.assetsSvgsLoveFilled
                            : Assets.assetsSvgsLove,

                        height: 16,
                      ),
                    ),
                  ],
                ),

                const VerticalSpace(height: 5),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  t.specialistMedicine,
                  style: context.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const VerticalSpace(height: 12),
                Row(
                  spacing: 5.w,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Icon(
                              Icons.star,
                              color: index < doctor.rate
                                  ? Colors.amber
                                  : AppColors.greyBorderColor,
                              size: 17.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpace(height: 3),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "\$ ${doctor.price} / hr",
                      style: context.textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
