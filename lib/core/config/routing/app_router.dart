import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/features/admin/features/bottom_nav_bar/presentation/screens/admin_bottom_nav_bar.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/admin_home/admin_home_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/create_doctor/create_doctor_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/screens/admin_create_doctor_screen.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/screens/update_doctor_screen.dart';
import 'package:doctor_hunt/features/admin/features/settings/presentation/screens/admin_edit_profile_screen.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/appointment_cubit.dart';
import 'package:doctor_hunt/features/appointment/presentation/screens/appointment_view_details_screen.dart';
import 'package:doctor_hunt/features/booking/presentation/manager/select_time_cubit.dart';
import 'package:doctor_hunt/features/booking/presentation/screens/select_time_screen.dart';
import 'package:doctor_hunt/core/manager/bottom_nav_bar/patient_bottom_nav_bar_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/screens/doctor_details_screen.dart';
import 'package:doctor_hunt/features/booking/presentation/screens/appointment_time_screen.dart';

import 'package:doctor_hunt/features/auth/presentation/choose_role/screens/choose_role_screen.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/screens/sign_in_screen.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/manager/cubit/sign_up_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/screens/sign_up_screen.dart';
import 'package:doctor_hunt/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/manager/home_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/screens/home_find_doctor_screen.dart';
import 'package:doctor_hunt/features/home/presentation/screens/home_see_all_feature_doctors_screen.dart';
import 'package:doctor_hunt/features/home/presentation/screens/home_see_all_popular_doctors_screen.dart';
import 'package:doctor_hunt/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:doctor_hunt/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:doctor_hunt/features/settings/presentation/screens/privacy_screen.dart';
import 'package:doctor_hunt/features/settings/presentation/screens/profile_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/bottom_nav_bar/presentation/screens/bottom_nav_bar_screen.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: _getInitialRoute(),

    // initialLocation: AppRoutes.doctorSelectTimeScreen,
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
          return BlocProvider(
            create: (context) => gi<BottomNavBarCubit>(),
            child: PatientBottomNavBarScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.doctorDetailsScreen,
        builder: (context, state) {
          var data = state.extra as Map<String, dynamic>;
          DoctorEntity doctor = data['doctor'];
          FavouriteCubit cubit = data['cubit'];
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: cubit),
              BlocProvider(create: (context) => gi.get<HomeCubit>()),
            ],
            child: DoctorDetailsScreen(doctor: doctor),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.appointmentViewDetailsScreen,
        builder: (context, state) {
          var data = state.extra as Map<String, dynamic>;
          AppointmentModel appoointment = data['appointment'];
          AppointmentCubit cubit = data['cubit'];
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: cubit),
              BlocProvider(create: (context) => gi.get<HomeCubit>()),
            ],
            child: AppointmentViewDetailsScreen(appointmentModel: appoointment),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.doctorDetailsScreen,
        builder: (context, state) {
          var data = state.extra as Map<String, dynamic>;
          DoctorEntity doctor = data['doctor'];
          FavouriteCubit cubit = data['cubit'];
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: cubit),
              BlocProvider(create: (context) => gi.get<HomeCubit>()),
            ],
            child: DoctorDetailsScreen(doctor: doctor),
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
        path: AppRoutes.AdminEditProfileScreen,
        builder: (context, state) {
          return AdminEditProfileScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.adminbottomNavBar,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => gi<BottomNavBarCubit>(),
            child: AdminBottomNavBar(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.privacyPolicyScreen,
        builder: (context, state) {
          return PrivacyScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.profileScreen,
        builder: (context, state) {
          return ProfileScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.adminCreateDoctorScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => gi.get<CreateDoctorCubit>(),
            child: AdminCreateDoctorScreen(
              adminHomeCubit: state.extra as AdminHomeCubit,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.adminUpdateDoctorScreen,
        builder: (context, state) {
          var data = state.extra as Map<String, dynamic>;
          DoctorEntity doctor = data['doctor'];
          AdminHomeCubit cubit = data['cubit'];
          return BlocProvider(
            create: (context) {
              return gi.get<CreateDoctorCubit>();
            },
            child: UpdateDoctorScreen(doctor: doctor, adminHomeCubit: cubit),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.seeAllPopularDoctorsScreen,
        builder: (context, state) {
          var data = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => data["homeCubit"] as HomeCubit),
              BlocProvider(
                create: (context) => data['favCubit'] as FavouriteCubit,
              ),
            ],
            child: HomeSeeAllPopularDoctorsScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.seeAllFeatureDoctoraScreen,
        builder: (context, state) {
          var data = state.extra as Map<String, dynamic>;
          HomeCubit homeCubit = data['homeCubit'];
          FavouriteCubit favouriteCubit = data['favCubit'];
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: homeCubit),
              BlocProvider.value(value: favouriteCubit),
            ],
            child: HomeSeeAllFeatureDoctorsScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.homeFindDoctorScreen,
        builder: (context, state) {
          var data = state.extra as Map<String, dynamic>;
          HomeCubit homeCubit = data['homeCubit'];
          FavouriteCubit favouriteCubit = data['favCubit'];
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: homeCubit),
              BlocProvider.value(value: favouriteCubit),
            ],
            child: HomeFindDoctorScreen(),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.doctorSelectTimeScreen,
        builder: (context, state) {
          var data = state.extra as Map<String, dynamic>;
          DoctorEntity doctor = data['doctor'] as DoctorEntity;
          FavouriteCubit cubit = data['cubit'] as FavouriteCubit;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => cubit),
              BlocProvider(create: (context) => gi<SelectTimeCubit>()),
            ],
            child: SelectTimeScreen(doctor: doctor),
          );
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
    } else {
      final role = SharedPreferencesHelper().get(key: AppStrings.role);

      if (role == null) return AppRoutes.signIn;
      switch (Role.values[role]) {
        case Role.patient:
          return AppRoutes.bottomNavBar;

        case Role.admin:
          return AppRoutes.adminbottomNavBar;
      }
    }
  }
}
