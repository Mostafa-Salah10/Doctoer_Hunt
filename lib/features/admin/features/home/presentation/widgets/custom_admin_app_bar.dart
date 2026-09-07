import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.suffixIcon,
    this.leadingAction,
    this.suffixAction,
  });

  final String title;
  final IconData leadingIcon;
  final IconData? suffixIcon;
  final VoidCallback? leadingAction;
  final VoidCallback? suffixAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      height: 90.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13.r),
          topRight: Radius.circular(13.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: leadingAction,
            child: Icon(
              leadingIcon,
              size: 23.h,
              color: AppColors.lightBackgroundColor,
            ),
          ),

          Text(
            title,
            style: context.textTheme.titleMedium!.copyWith(
              color: AppColors.lightBackgroundColor,
            ),
          ),

          suffixIcon != null
              ? InkWell(
                  onTap: suffixAction,

                  child: Icon(
                    suffixIcon,

                    size: 23.h,
                    color: AppColors.lightBackgroundColor,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
