import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/settings/data/models/patient_model.dart';
import 'package:doctor_hunt/features/settings/presentation/widgets/profile_form.dart';
import 'package:doctor_hunt/features/settings/presentation/widgets/profile_top_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.patient});
  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      withHorizontalPadding: false,
      child: Column(
        children: [
          ProfileTopCard(imageUrl: patient.imageUrl),
          const VerticalSpace(height: 15),
          Expanded(child: ProfileForm(patient: patient)),
        ],
      ),
    );
  }
}
