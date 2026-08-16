import 'package:doctor_hunt/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  void onPageChanged(int index) {
    currentIndex = index;
    emit(OnboardingPageChanged());
  }

  void onNextPressed() {
    if (currentIndex == OnboardingModel.onboardingData.length - 1) return;
    pageController.animateToPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      currentIndex + 1,
    );
    currentIndex++;
    emit(OnboardingPageChanged());
  }

  void skip() {
    pageController.animateToPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      OnboardingModel.onboardingData.length - 1,
    );
    currentIndex = OnboardingModel.onboardingData.length - 1;
    emit(OnboardingPageChanged());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
