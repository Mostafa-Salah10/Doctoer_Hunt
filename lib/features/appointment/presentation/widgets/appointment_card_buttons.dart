import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/enums/booking_status.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/appointment_cubit.dart';
import 'package:doctor_hunt/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentCardButtons extends StatelessWidget {
  const AppointmentCardButtons({super.key, required this.appointmentModel});

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
              context.pushNamed(
                AppRoutes.doctorDetailsScreen,
                arguments: {
                  'doctor': DoctorEntity(
                    id: appointmentModel.doctorId,
                    name: appointmentModel.doctorName,
                    imageUrl: appointmentModel.doctorImage,
                    isActive: true,
                    speciality: appointmentModel.speciality,
                    cost: appointmentModel.consulationFee,
                    rating: 3,
                  ),
                  'cubit': gi<FavouriteCubit>(),
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.primaryColor),

                borderRadius: BorderRadius.circular(6),
              ),

              child: Center(
                child: Text(
                  "View Details",
                  style: context.textTheme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),

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
            : appointmentModel.status == BookingStatus.cancelled
            ? SizedBox()
            : Expanded(
                child: BlocBuilder<AppointmentCubit, AppointmentState>(
                  buildWhen: (previous, current) =>
                      current.rateDoctor.data == appointmentModel.bookingId,
                  builder: (context, state) {
                    return AppButton(
                      text: state.rateDoctor.isLoading
                          ? "Loading..."
                          : "Rate Doctor",
                      onPressed: () {
                        if (state.rateDoctor.isLoading) return;
                        cubit.rateDoctor(
                          doctorId: appointmentModel.doctorId,
                          appointmentId: appointmentModel.bookingId,
                        );
                      },
                    );
                  },
                ),
              ),
      ],
    );
  }
}
