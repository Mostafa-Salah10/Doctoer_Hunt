import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/features/onboarding/presentation/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      withHorizontalPadding: false,
      child: OnboardingWidget(),
    );
  }
}
