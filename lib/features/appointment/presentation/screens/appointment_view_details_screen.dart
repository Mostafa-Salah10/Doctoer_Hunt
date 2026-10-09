import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/enums/booking_status.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/appointment_cubit.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_booking_status_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_patient_doctor_card.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_show_details_button.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_show_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentViewDetailsScreen extends StatelessWidget {
  const AppointmentViewDetailsScreen({
    super.key,
    required this.appointmentModel,
  });

  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorLight,

      appBar: AppBar(
        title: Text("Appointment Details"),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const VerticalSpace(height: 20),
              AppointmentPatientDoctorCard(
                image: appointmentModel.paientImage,
                subTitle: "patient@gmai.com",
                title: appointmentModel.patientName,
                isDoctor: false,
              ),
              const VerticalSpace(height: 15),
              AppointmentPatientDoctorCard(
                image: appointmentModel.doctorImage,
                subTitle: appointmentModel.speciality,
                title: appointmentModel.doctorName,
                isDoctor: true,
              ),

              const VerticalSpace(height: 12),

              AppointmentBookingStatusWidget(status: appointmentModel.status),
              const VerticalSpace(height: 12),
              AppointmentShowDetailsCard(appointmentModel: appointmentModel),
              const Spacer(),
              BlocConsumer<AppointmentCubit, AppointmentState>(
                buildWhen: (previous, current) =>
                    previous.cancelAppointment != current.cancelAppointment,

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
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      if (appointmentModel.status == BookingStatus.upcoming)
                        AppointmentShowDetailsButtons(
                          appointmentModel: appointmentModel,
                        ),
                    ],
                  );
                },
              ),

              const VerticalSpace(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
