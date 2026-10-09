import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/enums/booking_status.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminAppointmentCardButtons extends StatelessWidget {
  const AdminAppointmentCardButtons({
    super.key,
    required this.appointmentModel,
  });

  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppointmentCubit>();

    return Row(
      spacing: 20,
      children: [
        appointmentModel.status == BookingStatus.upcoming
            ? Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (cubit.state.cancelAppointment.isLoading) return;
                    cubit.cancelAppointment(appointment: appointmentModel);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.errorColor),
                      color: AppColors.errorColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),

                    child: Center(
                      child: BlocBuilder<AppointmentCubit, AppointmentState>(
                        buildWhen: (previous, current) =>
                            current.cancelAppointment.data ==
                            appointmentModel.bookingId,
                        builder: (context, state) {
                          return Text(
                            state.cancelAppointment.isLoading
                                ? "Loading..."
                                : "Cancel Appointment",
                            style: context.textTheme.bodySmall!.copyWith(
                              color: AppColors.errorColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              )
            : Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.appointmentViewDetailsScreen,
                      arguments: {
                        "cubit": context.read<AppointmentCubit>(),
                        "appointment": appointmentModel,
                      },
                    );
                  },
                  child: BlocBuilder<AppointmentCubit, AppointmentState>(
                    builder: (context, state) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            width: 1,
                            color: AppColors.primaryColor,
                          ),
                        ),

                        child: Center(
                          child: Text(
                            "View Details",
                            style: context.textTheme.bodySmall!.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

        if (appointmentModel.status == BookingStatus.upcoming)
          Expanded(
            child: GestureDetector(
              onTap: () {
                cubit.markAppointmentAsCompleted(appointment: appointmentModel);
              },
              child: BlocBuilder<AppointmentCubit, AppointmentState>(
                buildWhen: (previous, current) =>
                    current.markAppointmentAsCompleted.data ==
                    appointmentModel.bookingId,
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),

                      color: AppColors.primaryColor,
                    ),

                    child: Center(
                      child: Text(
                        state.markAppointmentAsCompleted.isLoading
                            ? "Loading..."
                            : "Mark as completed",
                        style: context.textTheme.bodySmall!.copyWith(
                          color: AppColors.lightBackgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
