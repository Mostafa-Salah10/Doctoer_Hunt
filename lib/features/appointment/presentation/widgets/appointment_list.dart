import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/appointment_cubit.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsList extends StatelessWidget {
  const AppointmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentState>(
      listenWhen: (previous, current) =>
          previous.cancelAppointment != current.cancelAppointment ||
          previous.rateDoctor != current.rateDoctor,
      listener: (context, state) {
        if (state.cancelAppointment.isError) {
          toastAlert(
            msg: state.cancelAppointment.error!,
            color: AppColors.errorColor,
          );
        } else if (state.cancelAppointment.isSuccess) {
          toastAlert(
            msg: "Booking cancelled successfully",
            color: AppColors.primaryColor,
          );
        } else if (state.rateDoctor.isError) {
          toastAlert(msg: state.rateDoctor.error!, color: AppColors.errorColor);
        } else if (state.rateDoctor.isSuccess) {
          toastAlert(msg: "Rated successfully", color: AppColors.primaryColor);
        }
      },
      buildWhen: (previous, current) =>
          previous.getAppointments != current.getAppointments,
      builder: (context, state) {
        if (state.getAppointments.isLoading ||
            state.getAppointments.isInitial) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }

        return state.getAppointments.data!.isEmpty
            ? Center(child: Text("No Appointments"))
            : ListView.separated(
                itemCount: state.getAppointments.data!.length,
                separatorBuilder: (context, index) =>
                    const VerticalSpace(height: 13),
                itemBuilder: (context, index) => AppointmentCard(
                  appointmentModel: state.getAppointments.data!.elementAt(
                    index,
                  ),
                ),
              );
      },
    );
  }
}
