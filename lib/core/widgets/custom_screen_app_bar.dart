import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomScreensAppBar extends StatelessWidget {
  const CustomScreensAppBar({
    super.key,
    required this.title,
    this.suffixIcon = false,
    this.showBackButton = true,

    this.isLight = false,
  });

  final String title;

  final bool? suffixIcon;
  final bool showBackButton;

  final bool isLight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: Row(
        children: [
          if (showBackButton)
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? AppColors.darkBackgroundColor
                      : AppColors.lightBackgroundColor,

                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.assetsSvgsArrrowBack,
                    width: 7.w,
                    height: 13.h,
                  ),
                ),
              ),
            ),

          const HorizontalSpace(width: 20),
          Text(
            title,
            style: context.textTheme.titleMedium!.copyWith(
              color: isLight
                  ? AppColors.lightBackgroundColor
                  : context.isDarkMode
                  ? AppColors.lightBackgroundColor
                  : AppColors.darkTextColor,

              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),
          if (suffixIcon == true)
            GestureDetector(
              onTap: () {
                context.pushNamed(
                  AppRoutes.homeFindDoctorScreen,
                  arguments: {
                    "homeCubit": context.read<HomeCubit>(),
                    "favCubit": context.read<FavouriteCubit>(),
                  },
                );
              },
              child: Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? AppColors.darkBackgroundColor
                      : AppColors.lightBackgroundColor,

                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.assetsSvgsSearch,
                    width: 17.w,
                    height: 17.w,
                    colorFilter: ColorFilter.mode(
                      AppColors.darkBackgroundColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
