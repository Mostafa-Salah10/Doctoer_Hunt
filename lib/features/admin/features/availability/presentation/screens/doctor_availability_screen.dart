import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/widgets/doctor_availability_data.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/widgets/doctor_availability_top_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorAvailabilityScreen extends StatelessWidget {
  const DoctorAvailabilityScreen({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorLight,
      appBar: AppBar(
        title: Text("Doctor Availability"),
        backgroundColor: AppColors.primaryColorLight,
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(height: 15),
              DoctorAvailabilityTopCard(doctor: doctor),
              const VerticalSpace(height: 15),

              const DoctorAvailabilityData(),
              const VerticalSpace(height: 15),

              AppButton(text: "Save", onPressed: () {}),

              const VerticalSpace(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
