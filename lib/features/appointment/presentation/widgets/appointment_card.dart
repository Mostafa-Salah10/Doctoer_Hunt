import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/enums/booking_status.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_card_buttons.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_card_top_section.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_rate_doctor.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_show_specific_data.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointmentModel});

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
          AppinmentTopSection(appointmentModel: appointmentModel),
          const Divider(height: 30, color: AppColors.greyColor),
          Row(
            children: [
              Expanded(
                child: AppointmentShowSpecificDataCard(
                  image: Assets.assetsSvgsDate,
                  title: 'Appointment date',
                  subTitle: appointmentModel.date,
                ),
              ),
              Expanded(
                child: AppointmentShowSpecificDataCard(
                  image: Assets.assetsSvgsClock,
                  title: 'Appointment time',
                  subTitle: appointmentModel.slot,
                ),
              ),
            ],
          ),
          const VerticalSpace(height: 10),
          AppointmentShowSpecificDataCard(
            image: Assets.assetsSvgsDollar,
            title: 'Consultation fee',
            subTitle: '\$${appointmentModel.consulationFee}',
          ),

          if (appointmentModel.status == BookingStatus.completed)
            AppointmentRateDoctorWidget(
              appoinmentId: appointmentModel.bookingId,
            ),

          const VerticalSpace(height: 10),

          AppointmentCardButtons(appointmentModel: appointmentModel),
        ],
      ),
    );
  }
}
