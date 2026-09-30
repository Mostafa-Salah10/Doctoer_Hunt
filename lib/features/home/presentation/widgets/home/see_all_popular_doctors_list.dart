import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_popular_doctors_item.dart';
import 'package:flutter/material.dart';

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
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
            ),
            itemCount: doctors.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) => InkWell(
              onTap: () {
                context.pushNamed(
                  AppRoutes.appoinmentInfo,
                  arguments: doctors.elementAt(index),
                );
              },

              child: HomePopularDoctorsItem(doctor: doctors.elementAt(index)),
            ),
          );
  }
}
