import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/data/models/home_feature_doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_feature_doctor_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFeatureDoctorsList extends StatelessWidget {
  const HomeFeatureDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => const HorizontalSpace(width: 8),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: HomeFeatureDoctorModel.doctors.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: HomeFeatureDoctorListItem(
            doctor: HomeFeatureDoctorModel.doctors[index],
          ),
        ),
      ),
    );
  }
}
