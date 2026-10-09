import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/helpers/date_time_helper.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_show_specific_data.dart';
import 'package:flutter/material.dart';

class AppointmentShowDetailsCard extends StatelessWidget {
  const AppointmentShowDetailsCard({super.key, required this.appointmentModel});

  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(10),

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
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: AppointmentShowSpecificDataCard(
                  showContainer: true,
                  image: Assets.assetsSvgsDate,
                  title: 'Appointment date',
                  subTitle: DateTimeHelper.formatDateWithDayName(
                    appointmentModel.date,
                  ),
                ),
              ),
              Expanded(
                child: AppointmentShowSpecificDataCard(
                  showContainer: true,
                  image: Assets.assetsSvgsClock,
                  title: 'Appointment time',
                  subTitle: appointmentModel.slot,
                ),
              ),
            ],
          ),

          const VerticalSpace(height: 12),
          AppointmentShowSpecificDataCard(
            showContainer: true,
            image: Assets.assetsSvgsDollar,
            title: 'Consulation Fee',
            subTitle: '\$ ${appointmentModel.consulationFee}',
          ),
          const VerticalSpace(height: 12),
          AppointmentShowSpecificDataCard(
            showContainer: true,
            image: Assets.assetsSvgsLocation,
            title: 'Clinic Location',
            subTitle: "Central Clinic · 24 Garden Avenue",
          ),
        ],
      ),
    );
  }
}
