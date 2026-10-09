import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
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
    required this.onPop,
  });
  final int currentIndex;
  final ValueChanged<int> onBottomNavBarChanged;
  final List<String> icons;
  final List<String>? titles;
  final VoidCallback onPop;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => onPop(),
      child: Container(
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
            height: 74,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                icons.length,
                (index) => GestureDetector(
                  onTap: () => onBottomNavBarChanged(index),
                  child: !titles.isNull
                      ? Column(
                          children: [
                            _buildIconWithoutContainer(index),
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

  Widget _buildIconWithoutContainer(int index) {
    return SvgPicture.asset(
      icons[index],
      height: currentIndex == index ? 19.89.h : 20.h,
      width: currentIndex == index ? 20.w : 22.79.w,
      colorFilter: ColorFilter.mode(
        currentIndex == index ? AppColors.primaryColor : AppColors.greyColor,
        BlendMode.srcIn,
      ),
    );
  }
}
