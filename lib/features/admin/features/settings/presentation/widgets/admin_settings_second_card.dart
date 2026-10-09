import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AdminSettingsSecondCard extends StatelessWidget {
  const AdminSettingsSecondCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 0,
            color: AppColors.blackColor.withValues(alpha: 0.07),
            offset: Offset(0, 0),
          ),
        ],
      ),

      child: Column(
        spacing: 5,
        children: [
          InkWell(
            
            onTap: () => context.pushNamed(AppRoutes.AdminEditProfileScreen),
            child: Image.asset(Assets.assetsImagesAdminProfile)),
          Image.asset(Assets.assetsImagesHorizontalDivider),

          Image.asset(Assets.assetsImagesAdminChangePass),
          Image.asset(Assets.assetsImagesHorizontalDivider),
          Image.asset(Assets.assetsImagesAdminAppInfo),
        ],
      ),
    );
  }
}
