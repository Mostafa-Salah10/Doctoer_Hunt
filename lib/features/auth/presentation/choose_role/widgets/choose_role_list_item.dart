import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/uppper_lower_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/auth/data/models/role_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChooseRoleListItem extends StatelessWidget {
  const ChooseRoleListItem({
    super.key,
    required this.role,
    required this.selectedRole,
  });
  final RoleModel role;
  final Role selectedRole;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          child: Container(
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
              color: selectedRole == role.role
                  ? AppColors.lightBackgroundColor
                  : AppColors.lightIconColor,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: selectedRole == role.role
                    ? AppColors.secondaryColor
                    : AppColors.greyBorder,
                width: selectedRole == role.role ? 2.w : 1.w,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(8.h, 8.h, 8.h, 14.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightIconColor,
                    borderRadius: BorderRadius.circular(9999.r),
                  ),
                  child: SvgPicture.asset(
                    colorFilter: ColorFilter.mode(
                      selectedRole == role.role
                          ? AppColors.secondaryColor
                          : AppColors.greyColor,
                      BlendMode.srcIn,
                    ),
                    role.icon,
                    height: selectedRole == role.role ? 21.h : 23.33.h,
                    width: selectedRole == role.role ? 21.h : 18.67.h,
                  ),
                ),
                const HorizontalSpace(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role.role.name.toUpperCaseFirst,
                        style: context.textTheme.titleLarge,
                      ),
                      const VerticalSpace(height: 4),
                      Text(
                        role.description,
                        style: context.textTheme.titleSmall!.copyWith(
                          fontFamily: "PlusJakartaSans",
                          height: 20 / 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (selectedRole == role.role)
          Positioned(
            top: 16.h,
            right: 16.h,
            child: SvgPicture.asset(
              colorFilter: const ColorFilter.mode(
                AppColors.secondaryColor,
                BlendMode.srcIn,
              ),
              Assets.assetsSvgsSelectedRole,
              height: 23.33.h,
              width: 23.33.h,
            ),
          ),
      ],
    );
  }
}
