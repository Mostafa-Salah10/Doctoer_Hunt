import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_card_buttons.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_card_top_section.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_show_specific_data.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

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
          const AppinmentTopSection(),
          const Divider(height: 30, color: AppColors.greyColor),
          Row(
            children: [
              Expanded(
                child: AppointmentShowSpecificDataCard(
                  image: Assets.assetsSvgsDate,
                  title: 'Appointment date',
                  subTitle: '02 Oct 2026',
                ),
              ),
              Expanded(
                child: AppointmentShowSpecificDataCard(
                  image: Assets.assetsSvgsClock,
                  title: 'Appointment time',
                  subTitle: '10:30 AM',
                ),
              ),
            ],
          ),
          const VerticalSpace(height: 10),
          AppointmentShowSpecificDataCard(
            image: Assets.assetsSvgsDollar,
            title: 'Consultation fee',
            subTitle: r'$28.00',
          ),
          // AppointmentRateDoctorWidget(),

          const VerticalSpace(height: 10),

          AppointmentCardButtons(),
        ],
      ),
    );
  }
}
