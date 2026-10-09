import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/admin_home/admin_home_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/create_doctor/admin_create_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminCreateDoctorScreen extends StatelessWidget {
  const AdminCreateDoctorScreen({
    super.key,
    required AdminHomeCubit adminHomeCubit,
  }) : _adminHomeCubit = adminHomeCubit;

  final AdminHomeCubit _adminHomeCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Create Doctor"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),

        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const VerticalSpace(height: 35),
              AdminCreateDoctorForm(adminHomeCubit: _adminHomeCubit),
            ],
          ),
        ),
      ),
    );
  }
}
