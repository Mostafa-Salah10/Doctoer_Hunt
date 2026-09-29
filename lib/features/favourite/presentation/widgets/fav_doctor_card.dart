import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavDoctorCard extends StatelessWidget {
  const FavDoctorCard({super.key, required this.doctor});
  final DoctorEntity doctor;

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
              child: BlocBuilder<FavouriteCubit, FavouriteState>(
                buildWhen: (previous, current) =>
                    current.addOrRemoveFromFav.data == doctor.id,

                builder: (context, state) {
                  final fav = context.read<FavouriteCubit>();
                  return InkWell(
                    onTap: () {
                      if (fav.isFav(doctorId: doctor.id)) {
                        fav.removeFromFavourites(doctorId: doctor.id);
                      } else {
                        fav.addToFavourites(doctorId: doctor.id);
                      }
                    },
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        fav.isFav(doctorId: doctor.id)
                            ? Assets.assetsSvgsLoveFilled
                            : Assets.assetsSvgsLove,

                        height: 16.h,
                      ),
                    ),
                  );
                },
              ),
            ),

            const VerticalSpace(height: 8),
            Container(
              clipBehavior: Clip.hardEdge,
              width: 84.w,
              height: 84.w,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: CustomCachedNetworkImage(imageUrl: doctor.imageUrl),
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
              doctor.speciality,
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
