import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/error_widget.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/manager/home_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/see_all_feature_doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSeeAllFeatureDoctorsScreen extends StatefulWidget {
  const HomeSeeAllFeatureDoctorsScreen({super.key});

  @override
  State<HomeSeeAllFeatureDoctorsScreen> createState() =>
      _HomeSeeAllFeatureDoctorsScreenState();
}

class _HomeSeeAllFeatureDoctorsScreenState
    extends State<HomeSeeAllFeatureDoctorsScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getFeatureDoctors(limit: 100);
    context.read<FavouriteCubit>().getFavouritesIds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(
        child: Column(
          children: [
            CustomScreensAppBar(title: "Feature Doctors"),
            const VerticalSpace(height: 34),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    previous.getFeatureDoctors != current.getFeatureDoctors,
                builder: (context, state) {
                  if (state.getFeatureDoctors.isInitial ||
                      state.getFeatureDoctors.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (state.getFeatureDoctors.isError) {
                    return MyErrorWidget(
                      onRetry: () {
                        context.read<HomeCubit>().getFeatureDoctors(limit: 100);
                      },
                    );
                  }
        
                  return SeeAllFeatureDoctorsList(
                    doctors: state.getFeatureDoctors.data!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
