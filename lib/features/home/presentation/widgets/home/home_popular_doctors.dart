import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/presentation/manager/home_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_popular_doctors_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePopularDoctors extends StatelessWidget {
  const HomePopularDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.getPopularDoctors != current.getPopularDoctors,
      builder: (context, state) {
        if (state.getPopularDoctors.isInitial ||
            state.getPopularDoctors.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }
        return SizedBox(
          height: 250.h,
          child: state.getPopularDoctors.data!.isEmpty
              ? Center(
                  child: Text(
                    "No Doctors Found",
                    style: context.textTheme.bodyMedium,
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) =>
                      const HorizontalSpace(width: 15),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.getPopularDoctors.data!.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: HomePopularDoctorsItem(
                      doctor: state.getPopularDoctors.data!.elementAt(index),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
