import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/error_widget.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/appointment_cubit.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_category_list.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientAppointmentScreen extends StatelessWidget {
  const PatientAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(
        child: Column(
          children: [
            const CustomScreensAppBar(
              title: "Appointment",
              showBackButton: false,
            ),
            BlocBuilder<AppointmentCubit, AppointmentState>(
              buildWhen: (previous, current) =>
                  previous.getAppointments.error !=
                  current.getAppointments.error,
              builder: (context, state) {
                return state.getAppointments.isError
                    ? MyErrorWidget(
                        onRetry: () {
                          context
                              .read<AppointmentCubit>()
                              .getPatientAppointments();
                        },
                      )
                    : Expanded(
                        child: Column(
                          children: [
                            const VerticalSpace(height: 34),
                            const AppointmentCategoryList(),
                            const VerticalSpace(height: 24),

                            Expanded(child: const AppointmentsList()),
                          ],
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
