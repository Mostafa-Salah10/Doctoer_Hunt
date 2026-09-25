import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/data/models/home_feature_doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/manager/home_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_feature_doctor_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFeatureDoctorsList extends StatelessWidget {
  const HomeFeatureDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.getFeatureDoctors != current.getFeatureDoctors,
      builder: (context, state) {
        if (state.getFeatureDoctors.isInitial ||
            state.getFeatureDoctors.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }

        return SizedBox(
          height: 140.h,
          child: state.getFeatureDoctors.data!.isEmpty
              ? Center(
                  child: Text(
                    "No Doctors Found",
                    style: context.textTheme.bodyMedium,
                  ),
                )
              : ListView.separated(
            separatorBuilder: (context, index) =>
                const HorizontalSpace(width: 8),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: state.getFeatureDoctors.data!.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                context.pushNamed(
                  AppRoutes.appoinmentInfo,
                  arguments: HomeFeatureDoctorModel.doctors[index],
                );
              },
              child: HomeFeatureDoctorListItem(
                doctor:  state.getFeatureDoctors.data![index],
              ),
            ),
          ),
        );
      },
    );
  }
}
