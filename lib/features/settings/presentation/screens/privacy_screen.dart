import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomScreensAppBar(title: "Privacy policy"),

              const VerticalSpace(height: 34),

              Text(
                'Doctor Hunt Apps Privacy Policy',
                style: context.textTheme.bodyLarge,
              ),

              const VerticalSpace(height: 10),

              Text(
                'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words believable. It is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more ',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Color(0xff959CB4).withValues(alpha: 0.8),
                  fontSize: 14.sp,
                  height: 1.3,
                ),
              ),

              const VerticalSpace(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(Assets.assetsImagesPrivacyContent),
              ),

              const VerticalSpace(height: 10),

              Text(
                'It is a long established fact that reader distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established.',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Color(0xff959CB4).withValues(alpha: 0.8),
                  fontSize: 14.sp,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
