import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_doctor_details.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_doctor_details_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AdminDoctorDetailsScreen extends StatelessWidget {
  const AdminDoctorDetailsScreen({super.key, required this.doctor});

  final DoctorEntity doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctor Details"), centerTitle: true),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const VerticalSpace(height: 15),

              AdminDoctorDetailsImage(image: doctor.imageUrl),
              const VerticalSpace(height: 20),
              Text(doctor.name, style: context.textTheme.headlineMedium),
              const VerticalSpace(height: 20),

              SvgPicture.asset(
                height: 25,
                doctor.isActive
                    ? Assets.assetsSvgsActiveDoctor
                    : Assets.assetsSvgsInactiveDoctor,
              ),

              const VerticalSpace(height: 25),
              AdminDoctorDetailsCard(doctor: doctor),
              const VerticalSpace(height: 25),

              // InkWell(
              //   onTap: () {
              //     context.pushNamed(
              //       AppRoutes.adminUpdateDoctorScreen,
              //       arguments: doctor,
              //     );
              //   },
              //   child: Image.asset(Assets.assetsImagesDoctorEditButton),
              // ),
              // const VerticalSpace(height: 10),
              InkWell(
                onTap: () {
                  context.pushNamed(
                    AppRoutes.doctorAvailabilityScreen,
                    arguments: doctor,
                  );
                },
                child: Image.asset(Assets.assetsImagesDoctorMangeAvailabiltiy),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
