import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/admin_home/admin_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminFloatingActionButton extends StatelessWidget {
  const AdminFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.pushNamed(
          AppRoutes.adminCreateDoctorScreen,
          arguments: context.read<AdminHomeCubit>(),
        );
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
