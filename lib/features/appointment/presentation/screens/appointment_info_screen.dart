import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_doctor_card.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/appointment_form.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/who_is_patient_list.dart';
import 'package:doctor_hunt/features/home/data/models/home_feature_doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_title_see_all.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';

class AppointmentInfoScreen extends StatelessWidget {
  const AppointmentInfoScreen({super.key, required this.doctor});

  final HomeFeatureDoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: ListView(
        children: [
          CustomScreensAppBar(title: t.Appointment),
          const VerticalSpace(height: 34),
          AppointmentDoctorCard(doctor: doctor),
          const VerticalSpace(height: 30),
          HomeTitleAndSeeAll(title: t.AppointmentFor),
          const VerticalSpace(height: 20),
          const AppointmentFrom(),
          const VerticalSpace(height: 30),
          HomeTitleAndSeeAll(title: t.WhoIsThisPatient),
          const VerticalSpace(height: 20),
          const WhoIsPatientList(),
          const VerticalSpace(height: 20),
          AppButton(
            text: t.Next,
            onPressed: () {
              context.pushNamed(AppRoutes.appointmentTimeScreen);
            },
          ),
        ],
      ),
    );
  }
}
