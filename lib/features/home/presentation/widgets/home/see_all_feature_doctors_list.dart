import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:doctor_hunt/features/favourite/presentation/widgets/fav_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllFeatureDoctorsList extends StatelessWidget {
  const SeeAllFeatureDoctorsList({super.key, required this.doctors});

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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.88,
            ),
            itemCount: doctors.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) => InkWell(
              onTap: () {
                context.pushNamed(
                  AppRoutes.doctorDetailsScreen,
                  arguments: {
                    'doctor': doctors.elementAt(index),
                    'cubit': context.read<FavouriteCubit>(),
                  },
                );
              },

              child: FavDoctorCard(doctor: doctors[index]),
            ),
          );
  }
}
