import 'package:doctor_hunt/core/config/theme/app_colors.dart' show AppColors;
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/helpers/date_time_helper.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/models/doctor_working_day_model.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/manager/doctor_availability_cubit.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/widgets/determine_slot_duration.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/widgets/doctor_availability_time_container.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorAvailabilityWorkingHours extends StatelessWidget {
  const DoctorAvailabilityWorkingHours({super.key, required this.model});
  final DoctorAvailabilityModel model;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorAvailabilityCubit>();
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

      child: BlocBuilder<DoctorAvailabilityCubit, DoctorAvailabilityState>(
        builder: (context, state) {
          return Column(
            spacing: 20,
            children: [
              Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: DoctorAvailabilityTimeContainer(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((time) {
                          if (time != null) {
                            cubit.updateWorkingHours(time, true);
                          }
                        });
                      },
                      title: context.t.startTime.toUpperCase(),
                      time: DateTimeHelper.formatTimeForDisplay(
                        context,
                        model.startTime,
                      ),
                    ),
                  ),
                  Expanded(
                    child: DoctorAvailabilityTimeContainer(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((time) {
                          if (time != null) {
                            cubit.updateWorkingHours(time, false);
                          }
                        });
                      },
                      time: DateTimeHelper.formatTimeForDisplay(
                        context,
                        model.endTime,
                      ),
                      title: context.t.endTime.toUpperCase(),
                    ),
                  ),
                ],
              ),

              DoctorAvailabilityTimeContainer(
                onTap: () async {
                  final minutes = await showSlotDurationDialog(context, 30);
                  if (minutes != null) {
                    cubit.updateSlotDuration(minutes.toDouble());
                  }
                },
                title: context.t.slotDuration.toUpperCase(),
                time: DateTimeHelper.formatDuration(
                  context,
                  model.slotDuration.toInt(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
