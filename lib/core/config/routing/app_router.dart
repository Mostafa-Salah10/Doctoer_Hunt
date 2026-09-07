import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/screens/admin_bottom_nav_bar.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/screens/admin_create_doctor_screen.dart';
import 'package:doctor_hunt/features/appointment/presentation/screens/appointment_info_screen.dart';
import 'package:doctor_hunt/features/appointment/presentation/screens/appointment_time_screen.dart';

import 'package:doctor_hunt/features/auth/presentation/choose_role/screens/choose_role_screen.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/screens/sign_in_screen.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/manager/cubit/sign_up_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/screens/sign_up_screen.dart';
import 'package:doctor_hunt/features/home/data/models/home_feature_doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/screens/bottom_nav_bar_screen.dart';
import 'package:doctor_hunt/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:doctor_hunt/features/onboarding/presentation/screens/onboarding_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    // initialLocation: _getInitialRoute(),

    initialLocation: AppRoutes.adminbottomNavBar,

    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => gi<OnboardingCubit>(),
            child: const OnboardingScreen(),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.chooseRole,
        builder: (context, state) {
          return const ChooseRoleScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) {
          final role = state.extra as Role;

          return BlocProvider(
            create: (_) => gi<SignUpCubit>(),
            child: SignUpScreen(role: role),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => gi<SignInCubit>(),
            child: const SignInScreen(),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.bottomNavBar,
        builder: (context, state) {
          return BottomNavBarScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.appoinmentInfo,
        builder: (context, state) {
          return AppointmentInfoScreen(
            doctor: state.extra as HomeFeatureDoctorModel,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.appointmentTimeScreen,
        builder: (context, state) {
          return AppointmentTimeScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.adminbottomNavBar,
        builder: (context, state) {
          return AdminBottomNavBar();
        },
      ),
      GoRoute(
        path: AppRoutes.adminCreateDoctorScreen,
        builder: (context, state) {
          return AdminCreateDoctorScreen();
        },
      ),
    ],
  );

  static String _getInitialRoute() {
    final isVisitedOnboarding = SharedPreferencesHelper().get(
      key: AppStrings.isVisitedOnboarding,
    );

    if (isVisitedOnboarding == null) {
      return AppRoutes.onboarding;
    }

    return AppRoutes.bottomNavBar;
  }
}
