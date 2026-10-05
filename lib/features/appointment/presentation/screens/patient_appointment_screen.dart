import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_card.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_category_list.dart';
import 'package:flutter/material.dart';

class PatientAppointmentScreen extends StatelessWidget {
  const PatientAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(
        child: Column(
          children: [
            const CustomScreensAppBar(title: "Appointment"),
            const VerticalSpace(height: 34),
            const AppointmentCategoryList(),
            const VerticalSpace(height: 24),

            AppointmentCard(),
            const VerticalSpace(height: 15),
          ],
        ),
      ),
    );
  }
}
