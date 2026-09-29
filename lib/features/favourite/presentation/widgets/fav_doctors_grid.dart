import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:doctor_hunt/features/favourite/presentation/widgets/fav_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavDoctorsGrid extends StatelessWidget {
  const FavDoctorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<FavouriteCubit, FavouriteState>(
        listenWhen: (previous, current) =>
            previous.getFavouritesDoctors != current.getFavouritesDoctors,
        buildWhen: (previous, current) =>
            previous.getFavouritesDoctors != current.getFavouritesDoctors,
        listener: (context, state) {
          if (state.getFavouritesDoctors.isError) {
            toastAlert(
              msg: state.getFavouritesDoctors.error!,
              color: AppColors.errorColor,
            );
          }
        },
        builder: (context, state) {
          if (state.getFavouritesDoctors.isLoading ||
              state.getFavouritesDoctors.isInitial ||
              state.getFavouritesDoctors.isError) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
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
                  itemBuilder: (_, index) => FavDoctorCard(
                    doctor: state.getFavouritesDoctors.data![index],
                  ),
                );
        },
      ),
    );
  }
}
