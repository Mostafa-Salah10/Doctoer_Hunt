import 'package:doctor_hunt/core/config/theme/app_colors.dart' show AppColors;
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/helpers/date_time_helper.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/models/doctor_working_day_model.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/widgets/doctor_availability_time_container.dart';
import 'package:flutter/material.dart';

class DoctorAvailabilityWorkingHours extends StatelessWidget {
  const DoctorAvailabilityWorkingHours({super.key, required this.model});
  final DoctorAvailabilityModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            spreadRadius: 0,
            blurRadius: 10,
            color: AppColors.blackColor.withValues(alpha: 0.051),
          ),
        ],
      ),

      child: Column(
        spacing: 20,
        children: [
          Row(
            spacing: 15,
            children: [
              Expanded(
                child: DoctorAvailabilityTimeContainer(
                  onTap: () {},
                  title: "Start Time".toUpperCase(),
                  time: DateTimeHelper.formateTimeToAMAndPM(model.startTime),
                ),
              ),
              Expanded(
                child: DoctorAvailabilityTimeContainer(
                  onTap: () {},
                  time: DateTimeHelper.formateTimeToAMAndPM(model.endTime),
                  title: "End Time".toUpperCase(),
                ),
              ),
            ],
          ),

          DoctorAvailabilityTimeContainer(
            onTap: () {},
            title: "Slot Duration".toUpperCase(),
            time: "${model.slotDuration.toStringAsFixed(0)} Minutes",
          ),
        ],
      ),
    );
  }
}
