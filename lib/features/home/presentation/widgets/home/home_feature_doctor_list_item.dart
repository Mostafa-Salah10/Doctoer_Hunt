import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/data/models/home_feature_doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeFeatureDoctorListItem extends StatelessWidget {
  const HomeFeatureDoctorListItem({super.key, required this.doctor});
  final HomeFeatureDoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Card(
        color: AppColors.lightBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
        child: Padding(
          padding: EdgeInsets.all(8.h),
          child: Column(
            children: [
              HomeFetaureCardTopBar(doctor: doctor),
              const VerticalSpace(height: 8),
              CircleAvatar(
                radius: 27.r,
                backgroundImage: AssetImage(doctor.image),
              ),
              const VerticalSpace(height: 8),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                doctor.name,
                style: context.textTheme.labelMedium,
              ),
              const VerticalSpace(height: 3),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                "\$ ${doctor.price} / hours",
                style: context.textTheme.titleSmall!.copyWith(fontSize: 10.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeFetaureCardTopBar extends StatelessWidget {
  const HomeFetaureCardTopBar({super.key, required this.doctor});

  final HomeFeatureDoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: SvgPicture.asset(
            doctor.isFav ? Assets.assetsSvgsLoveFilled : Assets.assetsSvgsLove,

            height: 12.h,
          ),
        ),
        Row(
          spacing: 5.w,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 15.h),
            Text(doctor.rate.toString(), style: context.textTheme.labelMedium),
          ],
        ),
      ],
    );
  }
}
