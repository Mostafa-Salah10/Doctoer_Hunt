import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/data/models/home_popular_doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_popular_doctors_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePopularDoctors extends StatelessWidget {
  const HomePopularDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const HorizontalSpace(width: 15),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: HomePopularDoctorModel.popularDoctors.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: HomePopularDoctorsItem(
            doctor: HomePopularDoctorModel.popularDoctors[index],
          ),
        ),
      ),
    );
  }
}
