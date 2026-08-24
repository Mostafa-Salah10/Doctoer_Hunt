import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/favourite/data/models/doctor_fav_model.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class FavDoctorCard extends StatelessWidget {
  const FavDoctorCard({super.key, required this.doctor});
  final DoctorFavModel doctor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.isDarkMode
          ? AppColors.darkBackgroundColor
          : AppColors.lightBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset(
                  doctor.isFav
                      ? Assets.assetsSvgsLoveFilled
                      : Assets.assetsSvgsLove,

                  height: 16,
                ),
              ),
            ),

            const VerticalSpace(height: 8),
            CircleAvatar(
              radius: 42.r,
              backgroundImage: AssetImage(doctor.image),
            ),
            const VerticalSpace(height: 11),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              doctor.name,
              style: context.textTheme.bodyMedium,
            ),
            const VerticalSpace(height: 4),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              t[doctor.speciality],
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
