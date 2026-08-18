import 'package:doctor_hunt/core/config/theme/manager/theme_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/manager/cubit/sign_up_cubit.dart';
import 'package:doctor_hunt/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final gi = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void setupServiceLocator() async {
  ///all cubits
  gi.registerLazySingleton(() => OnboardingCubit());
  gi.registerLazySingleton(() => ThemeCubit());
  gi.registerFactory(() => SignUpCubit());
  gi.registerFactory(() => SignInCubit());
}
