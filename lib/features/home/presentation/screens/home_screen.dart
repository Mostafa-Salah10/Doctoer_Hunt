import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/error_widget.dart';
import 'package:doctor_hunt/features/home/presentation/manager/home_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_content.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_top_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_top_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final double containerHeight = 170.h;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.errorTypes != current.errorTypes,
      builder: (context, state) {
        return state.errorTypes != null
            ? MyErrorWidget(
                onRetry: () {
                  context.read<HomeCubit>().getPopularDoctors(limit: 3);
                  context.read<HomeCubit>().getFeatureDoctors(limit: 3);
                },
              )
            : SingleChildScrollView(
                child: Stack(
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
                ),
              );
      },
    );
  }
}
