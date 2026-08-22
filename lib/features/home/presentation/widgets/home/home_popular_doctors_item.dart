import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/data/models/home_popular_doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePopularDoctorsItem extends StatelessWidget {
  const HomePopularDoctorsItem({super.key, required this.doctor});

  final HomePopularDoctorModel doctor;

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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: AssetImage(doctor.image),
                    fit: BoxFit.cover,
                  ),
                ),
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
                          color: index < doctor.rate
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
