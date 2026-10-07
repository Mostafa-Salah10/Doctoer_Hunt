import 'package:doctor_hunt/core/widgets/custom_admin_app_bar_screens.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/error_widget.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/appointment_cubit.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/admin_appointments_list.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_category_list.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminAppointmentScreen extends StatelessWidget {
  const AdminAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(
        child: Column(
          children: [
            const CustomAdminAppBarScreens(title: "Appointment"),
            BlocBuilder<AppointmentCubit, AppointmentState>(
              buildWhen: (previous, current) =>
                  previous.getAppointments.error !=
                  current.getAppointments.error,
              builder: (context, state) {
                return state.getAppointments.isError
                    ? MyErrorWidget(
                        onRetry: () {
                          context.read<AppointmentCubit>().getAllAppointment();
                        },
                      )
                    : Expanded(
                        child: Column(
                          children: [
                            const VerticalSpace(height: 34),
                            const AppointmentCategoryList(),
                            const VerticalSpace(height: 24),

                            const Expanded(child: AdminAppointmentsList()),
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
