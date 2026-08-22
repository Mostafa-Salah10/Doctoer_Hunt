import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/doc_live_list.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_category_list.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_feature_doctors_list.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_popular_doctors.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_search_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_title_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeContent extends StatelessWidget {
  HomeContent({super.key, required this.containerHeight});
  final double containerHeight;

  final double searchBarHeight = 54.h;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: containerHeight - searchBarHeight / 2,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeSearchBar(searchBarHeight: searchBarHeight),

          const VerticalSpace(height: 30),

          const HomeTitleAndSeeAll(title: "Live Doctors"),

          const VerticalSpace(height: 20),

          DoctorLiveList(),

          const VerticalSpace(height: 30),

          const HomeCategoryList(),

          const VerticalSpace(height: 30),

          HomeTitleAndSeeAll(title: "Popular Doctor", onTap: () {}),

          const VerticalSpace(height: 20),

          const HomePopularDoctors(),

          const VerticalSpace(height: 30),

          HomeTitleAndSeeAll(title: "Feature Doctor", onTap: () {}),

          const VerticalSpace(height: 20),

          const HomeFeatureDoctorsList(),
        ],
      ),
    );
  }
}
