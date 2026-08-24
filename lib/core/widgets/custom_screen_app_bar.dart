import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomScreensAppBar extends StatelessWidget {
  const CustomScreensAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
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
              color: context.isDarkMode
                  ? AppColors.lightBackgroundColor
                  : AppColors.darkTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
