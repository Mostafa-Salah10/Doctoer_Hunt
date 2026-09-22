import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_enitity.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:doctor_hunt/core/widgets/custom_bottom_sheet_confirm_widget.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/admin_home/admin_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminAllDoctorsItem extends StatelessWidget {
  final DoctorEnitity doctor;

  const AdminAllDoctorsItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          clipBehavior: Clip.antiAlias,
          child: CustomCachedNetworkImage(
            width: 69.w,
            height: 60.h,
            imageUrl: doctor.imageUrl,
          ),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: context.isDarkMode
                      ? AppColors.lightBackgroundColor
                      : AppColors.darkBackgroundColor,
                ),
              ),

              SizedBox(height: 4.h),

              Text(doctor.speciality, style: context.textTheme.titleSmall),

              SizedBox(height: 4.h),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  doctor.isActive ? "Active" : "Not Active",
                  style: context.textTheme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 8.w),

        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => BlocProvider(
                create: (context) => gi.get<AdminHomeCubit>(),
                child: CustomBottomSheetConfirmWidget(
                  cancelText: "Delete",
                  confirmText: "Update",
                  onConfirm: () {
                    Navigator.pop(context);
                    context.pushNamed(
                      AppRoutes.adminUpdateDoctorScreen,
                      arguments: doctor,
                    );
                  },
                  onCancel: () async {
                    await gi.get<AdminHomeCubit>().deleteDoctor(
                      doctorId: doctor.id,
                    );

                    if (!context.mounted) return;
                    Navigator.pop(context);
                  },
                  cancelColor: AppColors.errorColor,

                  title: 'Manage Doctor?',
                  description:
                      'Update the doctor\'s information or remove the doctor from your account',
                ),
              ),
            );
          },
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
