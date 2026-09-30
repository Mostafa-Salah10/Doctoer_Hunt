import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorDetailsHorizontalCard extends StatelessWidget {
  const DoctorDetailsHorizontalCard({super.key, required this.doctor});

  final DoctorEntity doctor;

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
          Container(
            clipBehavior: Clip.hardEdge,
            width: 84.w,
            height: 84.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: CustomCachedNetworkImage(imageUrl: doctor.imageUrl),
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
                    BlocBuilder<FavouriteCubit, FavouriteState>(
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
                              color: index < doctor.rating!.toInt()
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
                      "\$ ${doctor.cost} / hr",
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
