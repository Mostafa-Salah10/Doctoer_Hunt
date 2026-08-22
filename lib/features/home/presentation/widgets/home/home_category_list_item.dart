import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/features/home/data/models/home_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCategoryListItem extends StatelessWidget {
  const HomeCategoryListItem({super.key, required this.category});

  final HomeCategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 70.w,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8.r),
        gradient: LinearGradient(
          colors: [category.linearOne, category.linearTwo],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.5, 1],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0 / 2,
            bottom: -20.w,
            child: _buildCircleOverlay(),
          ),
          Positioned(top: -5, right: -70.w / 2, child: _buildCircleOverlay()),

          Center(
            child: SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                AppColors.lightBackgroundColor,
                BlendMode.srcIn,
              ),
              category.icon,
              width: 20.w,
              height: 22.30434799194336.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleOverlay() {
    return Container(
      width: 70.w,
      height: 70.w,
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor.withValues(alpha: 0.15),
        shape: BoxShape.circle,
      ),
    );
  }
}
