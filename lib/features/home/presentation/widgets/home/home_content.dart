import 'package:doctor_hunt/features/home/presentation/widgets/home/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeContent extends StatelessWidget {
  HomeContent({super.key, required this.containerHeight});
  final double containerHeight;

  final double searchBarHeight = 54.h;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: containerHeight - searchBarHeight / 2,
      left: 20.w,
      right: 20.w,
      child: SingleChildScrollView(
        child: Column(
          children: [HomeSearchBar(searchBarHeight: searchBarHeight)],
        ),
      ),
    );
  }
}
