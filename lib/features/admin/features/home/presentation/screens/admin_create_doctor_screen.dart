import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/create_doctor/admin_create_doctor.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/custom_admin_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AdminCreateDoctorScreen extends StatelessWidget {
  const AdminCreateDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: AdminAppBar(
          leadingIcon: Icons.arrow_back,
          title: "Create Doctor",
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
              AdminCreateDoctorForm(),
            ],
          ),
        ),
      ),
    );
  }
}
