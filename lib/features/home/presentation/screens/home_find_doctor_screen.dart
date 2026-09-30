import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/favourite/presentation/widgets/favourite_search_bar.dart';
import 'package:doctor_hunt/features/home/presentation/manager/home_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/see_all_popular_doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFindDoctorScreen extends StatefulWidget {
  const HomeFindDoctorScreen({super.key});

  @override
  State<HomeFindDoctorScreen> createState() => _HomeFindDoctorScreenState();
}

class _HomeFindDoctorScreenState extends State<HomeFindDoctorScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getAllDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(
        child: Column(
          children: [
            const CustomScreensAppBar(title: "Find Doctor"),
            const VerticalSpace(height: 34),
            CustomSearchBar(
              onSearch: (word) {
                context.read<HomeCubit>().searchForDoctor(word: word);
              },
              title: "Dentist",
            ),
            const VerticalSpace(height: 20),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    previous.getSearchedDoctors != current.getSearchedDoctors,
                builder: (context, state) {
                  if (state.getSearchedDoctors.isInitial ||
                      state.getSearchedDoctors.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (state.getSearchedDoctors.isError) {
                    return Center(child: Text(state.getSearchedDoctors.error!));
                  }
                  return SeeAllPopularDoctorsList(
                    doctors: state.getSearchedDoctors.data!,
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
