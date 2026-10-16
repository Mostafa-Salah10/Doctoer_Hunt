import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_show_specific_data.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';

class AdminDoctorDetailsCard extends StatelessWidget {
  const AdminDoctorDetailsCard({super.key, required this.doctor});

  final DoctorEntity doctor;

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
        children: [
          AppointmentShowSpecificDataCard(
            isLarge: true,
            image: Assets.assetsSvgsAdminDoctor,
            title: context.t.speciality,
            subTitle: doctor.speciality,
          ),

          const Divider(height: 30),

          AppointmentShowSpecificDataCard(
            isLarge: true,
            image: Assets.assetsSvgsStarOutline,
            title: context.t.rating,
            subTitle: doctor.rating.toString(),
          ),
          const Divider(height: 30),

          AppointmentShowSpecificDataCard(
            isLarge: true,
            image: Assets.assetsSvgsDollar,
            title: context.t.consultationFee,
            subTitle: doctor.cost.toString(),
          ),
        ],
      ),
    );
  }
}
