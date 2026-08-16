import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/onboarding/data/models/onboarding_model.dart';
import 'package:doctor_hunt/features/onboarding/presentation/widgets/custom_onboarding_linear_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageViewItem extends StatelessWidget {
  final OnboardingModel model;
  final bool isSecondPage;
  const OnboardingPageViewItem({
    super.key,
    required this.model,
    required this.isSecondPage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomOnboardingLinearCircle(isSecondPage: isSecondPage),
        Column(
          children: [
            const VerticalSpace(height: 64),
            Center(
              child: Container(
                width: 336.w,
                height: 336.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(model.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const VerticalSpace(height: 85),

            Text(model.title, style: context.textTheme.headlineMedium),
            const VerticalSpace(height: 11),

            Text(
              textAlign: TextAlign.center,
              model.subTitle,

              style: context.textTheme.titleSmall,
            ),
            const VerticalSpace(height: 52),
          ],
        ),
      ],
    );
  }
}
