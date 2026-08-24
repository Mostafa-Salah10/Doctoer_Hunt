import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/favourite/presentation/widgets/fav_doctors_grid.dart';
import 'package:doctor_hunt/features/favourite/presentation/widgets/favourite_search_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_feature_doctors_list.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_title_see_all.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Column(
        children: [
          CustomScreensAppBar(title: context.t.favouriteDoctors),

          const VerticalSpace(height: 34),
          const FavouriteSearchBar(),
          const VerticalSpace(height: 24),
          const FavDoctorsGrid(),
          const VerticalSpace(height: 29),

          HomeTitleAndSeeAll(title: "Feature Doctor", onTap: () {}),

          const VerticalSpace(height: 20),

          const HomeFeatureDoctorsList(),
        ],
      ),
    );
  }
}
