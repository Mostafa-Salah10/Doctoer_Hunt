import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminFloatingActionButton extends StatelessWidget {
  const AdminFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.pushNamed(AppRoutes.adminCreateDoctorScreen);
      },
      backgroundColor: AppColors.primaryColor,
      shape: const StadiumBorder(),
      icon: Icon(Icons.add, color: AppColors.lightBackgroundColor, size: 20.h),
      label: Text(
        'Add Doctor',
        style: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.lightBackgroundColor,
        ),
      ),
    );
  }
}
