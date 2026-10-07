import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/enums/booking_status.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/helpers/date_time_helper.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/admin_appointment_top_section.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/admin_appointments_buttons_card.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_show_specific_data.dart';
import 'package:flutter/material.dart';

class AdminAppointmentCard extends StatelessWidget {
  const AdminAppointmentCard({super.key, required this.appointmentModel});

  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
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
          AdminAppointmentTopSection(appointmentModel: appointmentModel),
          const Divider(height: 30, color: AppColors.greyColor),

          Row(
            spacing: 8,
            children: [
              Expanded(
                child: AppointmentShowSpecificDataCard(
                  image: Assets.assetsSvgsDate,
                  title: 'Date',
                  subTitle: DateTimeHelper.formatDateWithDayName(
                    appointmentModel.date,
                  ),
                ),
              ),
              Expanded(
                child: AppointmentShowSpecificDataCard(
                  image: Assets.assetsSvgsClock,
                  title: 'Time',
                  subTitle: appointmentModel.slot,
                ),
              ),
              Expanded(
                child: AppointmentShowSpecificDataCard(
                  image: Assets.assetsSvgsDollar,
                  title: 'Fee',
                  subTitle: "\$${appointmentModel.consulationFee}",
                ),
              ),
            ],
          ),
          const VerticalSpace(height: 10),

          if (appointmentModel.status == BookingStatus.completed)
            Image.asset(Assets.assetsImagesFakeRateDoctor),
          const VerticalSpace(height: 10),
          AdminAppointmentCardButtons(appointmentModel: appointmentModel),
        ],
      ),
    );
  }
}
