import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/widgets/doctor_details_horizontal_card.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        : ListView.separated(
            separatorBuilder: (context, index) =>
                const VerticalSpace(height: 10),
            padding: EdgeInsets.zero,

            itemCount: doctors.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) => InkWell(
              onTap: () {
                context.pushNamed(
                  AppRoutes.appoinmentInfo,
                  arguments: {
                    'cubit': context.read<FavouriteCubit>(),
                    "doctor": doctors.elementAt(index),
                  },
                );
              },

              child: DoctorDetailsHorizontalCard(
                doctor: doctors.elementAt(index),
              ),
            ),
          );
  }
}
