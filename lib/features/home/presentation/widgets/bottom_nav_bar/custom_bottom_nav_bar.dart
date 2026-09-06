import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/null_or_empty_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onBottomNavBarChanged,
    required this.icons,
    this.titles,
  });
  final int currentIndex;
  final ValueChanged<int> onBottomNavBarChanged;
  final List<String> icons;
  final List<String>? titles;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.25),
            blurRadius: 180.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: BottomAppBar(
          color: context.isDarkMode
              ? AppColors.darkBackgroundColor
              : AppColors.lightBackgroundColor,
          height: !titles.isNull ? 90.h : 74.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              icons.length,
              (index) => GestureDetector(
                onTap: () => onBottomNavBarChanged(index),
                child: !titles.isNull
                    ? Column(
                        children: [
                          _buildCircleIcon(index),
                          SizedBox(height: 5.h),
                          Text(
                            titles![index],
                            style: context.textTheme.bodySmall!.copyWith(
                              color: currentIndex == index
                                  ? AppColors.primaryColor
                                  : AppColors.greyColor,
                            ),
                          ),
                        ],
                      )
                    : _buildCircleIcon(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildCircleIcon(int index) {
    return Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(
        color: currentIndex == index ? AppColors.primaryColor : null,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          icons[index],
          height: currentIndex == index ? 19.89.h : 20.h,
          width: currentIndex == index ? 20.w : 22.79.w,
          colorFilter: ColorFilter.mode(
            currentIndex == index
                ? AppColors.lightBackgroundColor
                : AppColors.greyColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
