import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_content.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_top_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_top_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final double containerHeight = 170.h;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          width: 216.w,
          height: 216.h,
          top: 148.h,
          left: -15,
          child: Image.asset(Assets.assetsImagesTopEllipse),
        ),
        Positioned(
          width: 216.w,
          height: 216.h,
          bottom: -10,
          right: 0,
          child: Image.asset(Assets.assetsImagesBottomEllipse),
        ),
        HomeTopContainer(containerHeight: containerHeight),
        const HomeTopAppBar(),
        HomeContent(containerHeight: containerHeight),
      ],
    );
  }
}
