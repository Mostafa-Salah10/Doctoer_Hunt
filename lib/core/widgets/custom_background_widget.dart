import 'package:doctor_hunt/core/utils/app_sizes.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackgroundWidget extends StatelessWidget {
  const CustomBackgroundWidget({
    super.key,
    required this.child,
    this.horizontalPadding,
    this.verticalPadding,
    this.appBar,
    this.withHorizontalPadding = true,
  });
  final Widget child;
  final double? horizontalPadding;
  final double? verticalPadding;
  final PreferredSizeWidget? appBar;
  final bool? withHorizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: withHorizontalPadding == true
                ? horizontalPadding ?? AppSizes.marginL
                : 0.0,
            vertical: verticalPadding ?? 0.0,
          ),
          child: Stack(
            children: [
              Positioned(
                width: 216.w,
                height: 216.h,
                top: 0,
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

              child,
            ],
          ),
        ),
      ),
    );
  }
}
