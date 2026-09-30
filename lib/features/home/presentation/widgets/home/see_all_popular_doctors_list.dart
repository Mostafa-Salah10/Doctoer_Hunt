import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_popular_doctors_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllPopularDoctorsList extends StatelessWidget {
  const SeeAllPopularDoctorsList({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return doctors.isEmpty
        ? Center(
            child: Text(
              "No Doctors Found",
              style: context.textTheme.bodyMedium,
            ),
          )
        : GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.67,
            ),
            itemCount: doctors.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) =>
                HomePopularDoctorsItem(doctor: doctors.elementAt(index)),
          );
  }
}
