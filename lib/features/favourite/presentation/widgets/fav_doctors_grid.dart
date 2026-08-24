import 'package:doctor_hunt/features/favourite/data/models/doctor_fav_model.dart';
import 'package:doctor_hunt/features/favourite/presentation/widgets/fav_doctor_card.dart';
import 'package:flutter/material.dart';

class FavDoctorsGrid extends StatelessWidget {
  const FavDoctorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.88,
        ),
        itemCount: DoctorFavModel.doctors.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) =>
            FavDoctorCard(doctor: DoctorFavModel.doctors[index]),
      ),
    );
  }
}
