import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/features/auth/presentation/choose_role/screens/choose_role_screen.dart';
import 'package:doctor_hunt/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart'
    show OnboardingCubit;
import 'package:doctor_hunt/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => gi<OnboardingCubit>(),
            child: const OnboardingScreen(),
          ),
        );
      case AppRoutes.chooseRole:
        return MaterialPageRoute(
          builder: (_) => const ChooseRoleScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static String get getInitialRoute {
    final isVisitedOnboarding = SharedPreferencesHelper().get(
      key: AppStrings.isVisitedOnboarding,
    );
    if (isVisitedOnboarding == null) {
      return AppRoutes.onboarding;
    } else {
      return AppRoutes.signIn;
    }
  }
}
