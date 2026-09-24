import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_enitity.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/admin_home/admin_home_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/create_doctor/admin_create_doctor.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/custom_admin_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateDoctorScreen extends StatelessWidget {
  const UpdateDoctorScreen({
    super.key,
    required this.doctor,
    required AdminHomeCubit adminHomeCubit,
  }) : _adminHomeCubit = adminHomeCubit;

  final DoctorEnitity doctor;
  final AdminHomeCubit _adminHomeCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: AdminAppBar(
          leadingIcon: Icons.arrow_back,
          title: "Update Doctor",
          leadingAction: () {
            context.pop();
          },
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),

        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const VerticalSpace(height: 35),
              AdminCreateDoctorForm(
                doctor: doctor,
                adminHomeCubit: _adminHomeCubit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
