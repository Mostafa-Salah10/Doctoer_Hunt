import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:doctor_hunt/features/favourite/presentation/widgets/fav_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavDoctorsGrid extends StatelessWidget {
  const FavDoctorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FavouriteCubit, FavouriteState>(
        buildWhen: (previous, current) =>
            previous.getFavouritesDoctors != current.getFavouritesDoctors,

        builder: (context, state) {
          if (state.getFavouritesDoctors.isLoading ||
              state.getFavouritesDoctors.isInitial) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          } else if (state.getFavouritesDoctors.isError) {
            return Center(child: Text(state.getFavouritesDoctors.error!));
          }
          return state.getFavouritesDoctors.data!.isEmpty
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
                  itemCount: state.getFavouritesDoctors.data!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.appoinmentInfo,
                        arguments: {
                          'cubit': context.read<FavouriteCubit>(),
                          'doctor': state.getFavouritesDoctors.data![index],
                        },
                      );
                    },
                    child: FavDoctorCard(
                      doctor: state.getFavouritesDoctors.data![index],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
