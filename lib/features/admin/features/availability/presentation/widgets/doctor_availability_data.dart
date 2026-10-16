import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/manager/doctor_availability_cubit.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/widgets/doctor_availability_days_list.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/widgets/doctor_availability_working_hours.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorAvailabilityData extends StatelessWidget {
  const DoctorAvailabilityData({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<DoctorAvailabilityCubit, DoctorAvailabilityState>(
        buildWhen: (previous, current) =>
            previous.workingDays != current.workingDays,
        builder: (context, state) {
          if (state.workingDays.isInitial || state.workingDays.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          } else if (state.workingDays.isError) {
            return Center(child: Text(context.t.somethingWentWrong));
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.t.workingDays,
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: context.isDarkMode
                            ? AppColors.lightBackgroundColor
                            : AppColors.blackColor,
                      ),
                    ),
                    BlocBuilder<
                      DoctorAvailabilityCubit,
                      DoctorAvailabilityState
                    >(
                      buildWhen: (previous, current) =>
                          previous.enabledDays != current.enabledDays,
                      builder: (context, state) {
                        return Text(
                          state.enabledDays > 0
                              ? state.enabledDays == 1
                                    ? context.t.oneDayEnabled
                                    : context.t.daysEnabled(
                                        count: state.enabledDays,
                                      )
                              : context.t.noDaysAvailable,
                          style: context.textTheme.titleSmall,
                        );
                      },
                    ),
                  ],
                ),
                const VerticalSpace(height: 15),

                DoctorAvailabilityDaysList(
                  workingDays: state.workingDays.data!.workingDays,
                ),

                const VerticalSpace(height: 15),
                Text(
                  context.t.workingHours,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: context.isDarkMode
                        ? AppColors.lightBackgroundColor
                        : AppColors.blackColor,
                  ),
                ),
                const VerticalSpace(height: 15),

                DoctorAvailabilityWorkingHours(model: state.workingDays.data!),
              ],
            ),
          );
        },
      ),
    );
  }
}
