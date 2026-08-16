import 'package:doctor_hunt/core/config/routing/app_router.dart';
import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_theme.dart';
import 'package:doctor_hunt/core/config/theme/manager/theme_cubit.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorHunt extends StatelessWidget {
  const DoctorHunt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode,
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppStrings.appName,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: state.themeMode,
                onGenerateRoute: AppRouter.onGenerateRoute,
                initialRoute: AppRoutes.onboarding,
              );
            },
          );
        },
      ),
    );
  }
}
