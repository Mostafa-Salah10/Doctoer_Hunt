import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';

import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/doctor_details_horizontal_card.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/doctor_details_map.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/doctor_details_services_section.dart';

import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(
        child: Column(
          children: [
            CustomScreensAppBar(title: "Doctor Details", suffixIcon: true),
            const VerticalSpace(height: 34),
            DoctorDetailsHorizontalCard(doctor: doctor),
            const VerticalSpace(height: 30),
            DoctorDetailsServicesSection(),
            const VerticalSpace(height: 30),
            DoctorDetailsMap(),
          ],
        ),
      ),
    );
  }
}
