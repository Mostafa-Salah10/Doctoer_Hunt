import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePopularDoctorsItem extends StatelessWidget {
  const HomePopularDoctorsItem({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,

      child: Card(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        color: AppColors.lightBackgroundColor,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(8.r),
                ),

                child: CustomCachedNetworkImage(imageUrl: doctor.imageUrl),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const VerticalSpace(height: 14),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    doctor.name,
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.isDarkMode
                          ? AppColors.lightBackgroundColor
                          : AppColors.darkBackgroundColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  const VerticalSpace(height: 5),

                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    doctor.speciality,
                    style: context.textTheme.titleSmall!.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  const VerticalSpace(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: Icon(
                          Icons.star,
                          color: index < doctor.rating!.toInt()
                              ? Colors.amber
                              : AppColors.greyBorderColor,
                          size: 17.sp,
                        ),
                      ),
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
