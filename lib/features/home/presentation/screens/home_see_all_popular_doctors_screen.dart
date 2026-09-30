import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/error_widget.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/presentation/manager/home_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/see_all_popular_doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSeeAllPopularDoctorsScreen extends StatefulWidget {
  const HomeSeeAllPopularDoctorsScreen({super.key});

  @override
  State<HomeSeeAllPopularDoctorsScreen> createState() =>
      _HomeSeeAllPopularDoctorsScreenState();
}

class _HomeSeeAllPopularDoctorsScreenState
    extends State<HomeSeeAllPopularDoctorsScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getPopularDoctors(limit: 100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(
        child: Column(
          children: [
            CustomScreensAppBar(title: "Popular Doctors"),
            const VerticalSpace(height: 34),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    previous.getPopularDoctors != current.getPopularDoctors,
                builder: (context, state) {
                  if (state.getPopularDoctors.isInitial ||
                      state.getPopularDoctors.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (state.getPopularDoctors.isError) {
                    return MyErrorWidget(
                      onRetry: () {
                        context.read<HomeCubit>().getPopularDoctors(limit: 100);
                      },
                    );
                  }
              
                  return SafeArea(
                    child: SeeAllPopularDoctorsList(
                      doctors: state.getPopularDoctors.data!,
                    ),
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
