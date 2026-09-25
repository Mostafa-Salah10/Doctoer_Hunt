import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeFeatureDoctorListItem extends StatelessWidget {
  const HomeFeatureDoctorListItem({super.key, required this.doctor});
  final DoctorEntity doctor;

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
              // CircleAvatar(
              //   radius: 27.r,
              //   backgroundImage: AssetImage(doctor.image),
              // ),

              Container(
                clipBehavior: Clip.hardEdge,
                width: 54.w,
                height: 54.w,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CustomCachedNetworkImage(imageUrl: doctor.imageUrl),
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
                "\$ ${doctor.cost} / hours",
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

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: SvgPicture.asset(
            1 == 1 ? Assets.assetsSvgsLoveFilled : Assets.assetsSvgsLove,

            height: 12.h,
          ),
        ),
        Row(
          spacing: 5.w,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 15.h),
            Text(
              doctor.rating.toString(),
              style: context.textTheme.labelMedium,
            ),
          ],
        ),
      ],
    );
  }
}
