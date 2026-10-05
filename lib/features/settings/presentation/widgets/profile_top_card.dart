import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTopCard extends StatelessWidget {
  const ProfileTopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 236.h,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),

        color: AppColors.primaryColor,
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SafeArea(
              child: const CustomScreensAppBar(title: "Profile", isLight: true),
            ),

            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      width: 130.w,
                      height: 130.w,
                      decoration: BoxDecoration(shape: BoxShape.circle),

                      child: Image.asset(
                        Assets.assetsImagesAppointment,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Image.asset(Assets.assetsImagesCamera, width: 50),
                    ),
                  ],
                ),
              ),
            ),
            const VerticalSpace(height: 20),
          ],
        ),
      ),
    );
  }
}
