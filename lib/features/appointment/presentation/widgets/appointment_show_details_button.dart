import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentShowDetailsButtons extends StatelessWidget {
  const AppointmentShowDetailsButtons({
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
        Expanded(
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
        ),
        // Expanded(
        //   child: GestureDetector(
        //     onTap: () {
        //       cubit.markAppointmentAsCompleted(appointment: appointmentModel);
        //     },
        //     child: BlocBuilder<AppointmentCubit, AppointmentState>(
        //       buildWhen: (previous, current) =>
        //           current.markAppointmentAsCompleted.data ==
        //           appointmentModel.bookingId,
        //       builder: (context, state) {
        //         return Container(
        //           padding: EdgeInsets.symmetric(vertical: 15),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(6),

        //             color: AppColors.primaryColor,
        //           ),

        //           child: Center(
        //             child: Text(
        //               state.markAppointmentAsCompleted.isLoading
        //                   ? "Loading..."
        //                   : "Mark as completed",
        //               style: context.textTheme.bodySmall!.copyWith(
        //                 color: AppColors.lightBackgroundColor,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
