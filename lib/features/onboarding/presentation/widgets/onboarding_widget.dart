import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/onboarding/data/models/onboarding_model.dart';
import 'package:doctor_hunt/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:doctor_hunt/features/onboarding/presentation/widgets/onboarding_page_view_item.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return Column(
      children: [
        ExpandablePageView.builder(
          controller: cubit.pageController,
          onPageChanged: cubit.onPageChanged,
          itemCount: OnboardingModel.onboardingData.length,
          itemBuilder: (context, index) => OnboardingPageViewItem(
            model: OnboardingModel.onboardingData[index],
            isSecondPage: index == 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 49.w),
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return AppButton(
                text:
                    cubit.currentIndex ==
                        OnboardingModel.onboardingData.length - 1
                    ? "Get Started"
                    : "Next",
                onPressed: () async {
                  if (cubit.currentIndex ==
                      OnboardingModel.onboardingData.length - 1) {
                    await SharedPreferencesHelper().set(
                      key: AppStrings.isVisitedOnboarding,
                      value: true,
                    );
                    if (!context.mounted) return;
                    context.pushReplacementNamed(AppRoutes.chooseRole);
                  } else {
                    cubit.onNextPressed();
                  }
                },
              );
            },
          ),
        ),

        VerticalSpace(height: 14),

        BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return Visibility(
              visible:
                  cubit.currentIndex !=
                  OnboardingModel.onboardingData.length - 1,
              child: InkWell(
                onTap: () {
                  cubit.skip();
                },
                child: Text(
                  textAlign: TextAlign.center,
                  "Skip",
                  style: context.textTheme.titleSmall,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
