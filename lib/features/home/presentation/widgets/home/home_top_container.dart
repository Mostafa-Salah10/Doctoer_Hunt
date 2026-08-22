import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTopContainer extends StatelessWidget {
  const HomeTopContainer({super.key, required this.containerHeight});

  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: containerHeight,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColorLinearOne,
              AppColors.primaryColorLinearTwo,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.5, 1],
          ),
        ),
      ),
    );
  }
}
